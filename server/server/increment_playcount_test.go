package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_IncrementPlayCount(t *testing.T) {
	account, _ := randomUser(t)
	song := randomSong(t, account.ID)

	testCases := []struct {
		name   string
		req    *pb.SongRequest
		setID  bool
		code   codes.Code
		before func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertSongIntoDB(t, client, song)
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
				SongId: utils.RandStringRunes(6),
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "no song found",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			setID: true,
			code:  codes.NotFound,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
			},
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

			res, err := server.IncrementPlayCount(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)

				s, err := client.Song.Query().Where(gen.IDEQ(song.ID)).First(ctx)
				require.NoError(t, err)
				require.Equal(t, 1, int(s.Plays))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
