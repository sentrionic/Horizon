package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/mock"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_DeleteSong(t *testing.T) {
	account, _ := randomUser(t)
	song := randomSong(t, account.ID)

	mockFileRepository := new(mocks.FileRepository)

	testCases := []struct {
		name       string
		req        *pb.SongRequest
		code       codes.Code
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertSongIntoDB(t, client, song)
				mockFileRepository.On("DeleteSong", mock.AnythingOfType("string")).Return(nil)
			},
		},
		{
			name: "invalid song id",
			req: &pb.SongRequest{
				SongId: utils.RandStringRunes(8),
			},
			code: codes.InvalidArgument,
		},
		{
			name: "no song found",
			req: &pb.SongRequest{
				SongId: song.ID.String(),
			},
			code: codes.NotFound,
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

			server := newSongServer(client, mockFileRepository)

			res, err := server.DeleteSong(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)

				_, err = client.Song.Query().Where(gen.IDEQ(song.ID)).First(ctx)
				require.Error(t, err)
				require.True(t, ent.IsNotFound(err))
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
