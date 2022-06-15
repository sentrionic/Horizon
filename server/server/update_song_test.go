package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_UpdateSong(t *testing.T) {
	account, _ := randomUser(t)
	song := randomSong(t, account.ID)

	newTitle := utils.RandStringRunes(8)

	testCases := []struct {
		name       string
		req        *pb.UpdateSongRequest
		code       codes.Code
		setID      bool
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.UpdateSongRequest{
				SongId: song.ID.String(),
				Title:  newTitle,
			},
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertSongIntoDB(t, client, song)
			},
			setID: true,
		},
		{
			name: "no user id set in context",
			req: &pb.UpdateSongRequest{
				SongId: song.ID.String(),
				Title:  newTitle,
			},
			code:  codes.Unauthenticated,
			setID: false,
		},
		{
			name: "title too short",
			req: &pb.UpdateSongRequest{
				SongId: song.ID.String(),
				Title:  utils.RandStringRunes(2),
			},
			code:       codes.InvalidArgument,
			setID:      true,
			errorField: "title",
		},
		{
			name: "invalid song id",
			req: &pb.UpdateSongRequest{
				SongId: utils.RandStringRunes(8),
				Title:  newTitle,
			},
			code:  codes.InvalidArgument,
			setID: true,
		},
		{
			name: "no song found",
			req: &pb.UpdateSongRequest{
				SongId: song.ID.String(),
				Title:  newTitle,
			},
			code:  codes.Internal,
			setID: true,
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

			server := newSongServer(client, new(mocks.FileRepository))

			res, err := server.UpdateSong(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, newTitle, res.GetTitle())
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
				checkBadRequest(t, st, tc.errorField)
			}
		})
	}
}
