package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_GetSongs(t *testing.T) {
	account, _ := randomUser(t)
	accountId := account.ID.String()
	invalidId := utils.RandStringRunes(8)

	song1 := randomSong(t, account.ID)
	song2 := randomSong(t, account.ID)

	artist, _ := randomUser(t)
	song3 := randomSong(t, artist.ID)

	client := setupTestDB(t)
	defer client.Close()

	insertUserIntoDB(t, client, account)
	insertUserIntoDB(t, client, artist)
	insertSongIntoDB(t, client, song1)
	insertSongIntoDB(t, client, song2)
	insertSongIntoDB(t, client, song3)

	testCases := []struct {
		name        string
		req         *pb.Filter
		code        codes.Code
		setID       bool
		expectedLen int
	}{
		{
			name:        "get all songs",
			code:        codes.OK,
			req:         &pb.Filter{},
			setID:       true,
			expectedLen: 3,
		},
		{
			name:  "no user id set in context",
			req:   &pb.Filter{},
			code:  codes.Unauthenticated,
			setID: false,
		},
		{
			name: "return one when query is applied",
			req: &pb.Filter{
				Query: &song1.Title,
			},
			code:        codes.OK,
			setID:       true,
			expectedLen: 1,
		},
		{
			name: "return two when artist is applied",
			req: &pb.Filter{
				ArtistId: &accountId,
			},
			code:        codes.OK,
			setID:       true,
			expectedLen: 2,
		},
		{
			name: "invalid artist ID",
			req: &pb.Filter{
				ArtistId: &invalidId,
			},
			code:  codes.InvalidArgument,
			setID: true,
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctx := context.Background()

			if tc.setID {
				ctx = context.WithValue(ctx, horizon.KeyUserID, account.ID.String())
			}

			server := newSongServer(client, new(mocks.FileRepository))

			res, err := server.GetSongs(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, tc.expectedLen, len(res.Songs))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
