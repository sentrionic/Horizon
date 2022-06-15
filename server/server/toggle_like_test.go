package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/like"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_ToggleLike(t *testing.T) {
	account, _ := randomUser(t)

	artist, _ := randomUser(t)
	song := randomSong(t, artist.ID)

	testCases := []struct {
		name   string
		req    *pb.SongRequest
		setID  bool
		code   codes.Code
		before func(*testing.T, *ent.Client)
		after  func(*testing.T, *ent.Client)
	}{
		{
			name: "successfully added like to song",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
				insertSongIntoDB(t, client, song)
			},
			after: func(t *testing.T, client *ent.Client) {
				result, err := client.Like.Query().
					Where(
						like.And(
							like.UserIDEQ(account.ID),
							like.SongIDEQ(song.ID)),
					).First(context.Background())
				require.NoError(t, err)
				require.NotNil(t, result)
			},
		},
		{
			name: "successfully unliked the song",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
				insertSongIntoDB(t, client, song)
				_, err := client.Like.Create().SetSongID(song.ID).SetUserID(account.ID).Save(context.Background())
				require.NoError(t, err)
			},
			after: func(t *testing.T, client *ent.Client) {
				_, err := client.Like.Query().
					Where(
						like.And(
							like.UserIDEQ(account.ID),
							like.SongIDEQ(song.ID)),
					).First(context.Background())
				require.Error(t, err)
				require.True(t, ent.IsNotFound(err))
			},
		},
		{
			name: "no user id in context",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name: "invalid song id",
			req: &pb.SongRequest{
				SongId: utils.RandStringRunes(8),
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "song not found",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: true,
			code:  codes.NotFound,
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctx := context.Background()
			client := setupTestDB(t)
			defer client.Close()
			if tc.before != nil {
				tc.before(t, client)
			}

			if tc.setID {
				ctx = context.WithValue(ctx, horizon.KeyUserID, account.ID.String())
			}

			server := newSongServer(client, mocks.NewFileRepository(t))

			res, err := server.ToggleLike(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				tc.after(t, client)
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
