package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/mocks"
	"github.com/sentrionic/horizon/pb"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestSongServer_GetLikedSongs(t *testing.T) {
	account, _ := randomUser(t)

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

	_, err := client.Like.Create().SetSongID(song1.ID).SetUserID(account.ID).Save(context.Background())
	require.NoError(t, err)
	_, err = client.Like.Create().SetSongID(song2.ID).SetUserID(account.ID).Save(context.Background())
	require.NoError(t, err)

	testCases := []struct {
		name  string
		req   *pb.Filter
		code  codes.Code
		setID bool
	}{
		{
			name:  "OK",
			code:  codes.OK,
			req:   &pb.Filter{},
			setID: true,
		},
		{
			name:  "no user id set in context",
			req:   &pb.Filter{},
			code:  codes.Unauthenticated,
			setID: false,
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

			res, err := server.GetLikedSongs(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, 2, len(res.Songs))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
