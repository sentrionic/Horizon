package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestPlaylistServer_UpdatePlaylist(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)

	invalidDescription := utils.RandStringRunes(160)

	newName := utils.RandStringRunes(10)
	newDescription := utils.RandStringRunes(50)

	testCases := []struct {
		name       string
		req        *pb.UpdatePlaylistRequest
		setID      bool
		code       codes.Code
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        newName,
				Description: &newDescription,
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertPlaylistIntoDB(t, client, playlist)
			},
		},
		{
			name: "name too short",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        utils.RandStringRunes(2),
				Description: &newDescription,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "name",
		},
		{
			name: "description too long",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        playlist.Name,
				Description: &invalidDescription,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "description",
		},
		{
			name: "no id set in context",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        playlist.Name,
				Description: playlist.Description,
			},
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name: "invalid playlist id",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  utils.RandStringRunes(8),
				Name:        playlist.Name,
				Description: playlist.Description,
			},
			setID: true,
			code:  codes.InvalidArgument,
		},
		{
			name: "playlist not found",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        playlist.Name,
				Description: playlist.Description,
			},
			setID: true,
			code:  codes.NotFound,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name: "playlist owner is not current user",
			req: &pb.UpdatePlaylistRequest{
				PlaylistId:  playlist.ID.String(),
				Name:        playlist.Name,
				Description: playlist.Description,
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

			res, err := server.UpdatePlaylist(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.GetName(), newName)
				require.Equal(t, res.GetDescription(), newDescription)

				pl, err := client.Playlist.Query().Where(gen.IDEQ(playlist.ID)).First(ctx)
				require.NoError(t, err)
				require.Equal(t, pl.Name, newName)
				require.Equal(t, *pl.Description, newDescription)
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
