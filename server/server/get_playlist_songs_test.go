package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestPlaylistServer_GetPlaylistSongs(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)

	artist, _ := randomUser(t)
	playlist2 := randomPlaylist(t, artist.ID)

	song1 := randomSong(t, artist.ID)
	song2 := randomSong(t, artist.ID)

	testCases := []struct {
		name   string
		req    *pb.PlaylistRequest
		code   codes.Code
		setID  bool
		before func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.PlaylistRequest{
				Id: playlist.ID.String(),
			},
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
				insertPlaylistIntoDB(t, client, playlist)
				insertSongIntoDB(t, client, song1)
				insertSongIntoDB(t, client, song2)

				_, err := client.PlaylistSong.Create().SetSongID(song1.ID).SetPlaylistID(playlist.ID).Save(context.Background())
				require.NoError(t, err)
				_, err = client.PlaylistSong.Create().SetSongID(song2.ID).SetPlaylistID(playlist.ID).Save(context.Background())
				require.NoError(t, err)
			},
			setID: true,
		},
		{
			name: "no user id set in context",
			req: &pb.PlaylistRequest{
				Id: playlist.ID.String(),
			},
			code:  codes.Unauthenticated,
			setID: false,
		},
		{
			name: "invalid playlist id",
			req: &pb.PlaylistRequest{
				Id: utils.RandStringRunes(5),
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "no playlist found",
			req: &pb.PlaylistRequest{
				Id: playlist.ID.String(),
			},
			setID: true,
			code:  codes.NotFound,
		},
		{
			name: "playlist owner is not current user",
			req: &pb.PlaylistRequest{
				Id: playlist2.ID.String(),
			},
			setID: true,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
				insertPlaylistIntoDB(t, client, playlist2)
			},
			code: codes.PermissionDenied,
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

			res, err := server.GetPlaylistSongs(ctx, tc.req)

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
