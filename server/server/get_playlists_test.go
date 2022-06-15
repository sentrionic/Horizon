package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestPlaylistServer_GetPlaylists(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)
	playlist2 := randomPlaylist(t, account.ID)

	artist, _ := randomUser(t)
	playlist3 := randomPlaylist(t, artist.ID)

	testCases := []struct {
		name   string
		code   codes.Code
		setID  bool
		before func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
				insertPlaylistIntoDB(t, client, playlist)
				insertPlaylistIntoDB(t, client, playlist2)
				insertPlaylistIntoDB(t, client, playlist3)
			},
			setID: true,
		},
		{
			name:  "no user id set in context",
			code:  codes.Unauthenticated,
			setID: false,
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

			server := newPlaylistServer(client)

			res, err := server.GetPlaylists(ctx, &pb.GetPlaylistRequest{})

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, 2, len(res.Playlists))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
