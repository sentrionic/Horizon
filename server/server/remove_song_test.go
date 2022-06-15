package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestPlaylistServer_RemoveSong(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)
	song := randomSong(t, account.ID)

	testCases := []struct {
		name   string
		req    *pb.PlaylistSongRequest
		setID  bool
		code   codes.Code
		before func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     song.ID.String(),
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertPlaylistIntoDB(t, client, playlist)
				insertSongIntoDB(t, client, song)
				_, err := client.PlaylistSong.Create().SetSongID(song.ID).SetPlaylistID(playlist.ID).Save(context.Background())
				require.NoError(t, err)
			},
		},
		{
			name: "no user id in context",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     song.ID.String(),
			},
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name: "invalid song id",
			req: &pb.PlaylistSongRequest{
				PlaylistId: utils.RandStringRunes(6),
				SongId:     song.ID.String(),
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "invalid playlist id",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     utils.RandStringRunes(5),
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "no playlist found",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     song.ID.String(),
			},
			setID: true,
			code:  codes.NotFound,
		},
		{
			name: "playlist owner is not current user",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     song.ID.String(),
			},
			setID: true,
			before: func(t *testing.T, client *ent.Client) {
				user2, _ := randomUser(t)
				playlist.UserID = user2.ID
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, user2)
				insertPlaylistIntoDB(t, client, playlist)
			},
			code: codes.PermissionDenied,
		},
		{
			name: "song not found",
			req: &pb.PlaylistSongRequest{
				PlaylistId: playlist.ID.String(),
				SongId:     song.ID.String(),
			},
			setID: true,
			before: func(t *testing.T, client *ent.Client) {
				playlist.UserID = account.ID
				insertUserIntoDB(t, client, account)
				insertPlaylistIntoDB(t, client, playlist)
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

			if tc.setID {
				ctx = context.WithValue(ctx, horizon.KeyUserID, account.ID.String())
			}

			server := newPlaylistServer(client)

			res, err := server.RemoveSong(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)

				_, err := client.PlaylistSong.
					Query().
					Where(
						gen.And(gen.SongIDEQ(song.ID),
							gen.PlaylistIDEQ(playlist.ID),
						),
					).
					First(ctx)
				require.Error(t, err)
				require.True(t, ent.IsNotFound(err))
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
