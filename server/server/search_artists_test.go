package server

import (
	"context"
	"github.com/sentrionic/horizon/pb"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"strings"
	"testing"
)

func TestArtistServer_SearchArtists(t *testing.T) {
	artist1, _ := randomUser(t)
	artist2, _ := randomUser(t)
	account, _ := randomUser(t)

	song1 := randomSong(t, artist1.ID)
	song2 := randomSong(t, artist2.ID)

	client := setupTestDB(t)
	defer client.Close()

	insertUserIntoDB(t, client, account)
	insertUserIntoDB(t, client, artist1)
	insertUserIntoDB(t, client, artist2)
	insertSongIntoDB(t, client, song1)
	insertSongIntoDB(t, client, song2)

	testCases := []struct {
		name        string
		req         *pb.SearchArtistRequest
		code        codes.Code
		expectedLen int
	}{
		{
			name:        "OK",
			req:         &pb.SearchArtistRequest{},
			code:        codes.OK,
			expectedLen: 2,
		},
		{
			name: "search for artist name",
			req: &pb.SearchArtistRequest{
				Query: strings.ToLower(artist1.Username[3:]),
			},
			code:        codes.OK,
			expectedLen: 1,
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctx := context.Background()
			server := newArtistServer(client)

			res, err := server.SearchArtists(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, tc.expectedLen, len(res.Artists))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
