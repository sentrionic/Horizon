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

func TestPlaylistServer_DeletePlaylist(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)

	account2, _ := randomUser(t)
	playlist2 := randomPlaylist(t, account2.ID)

	testCases := []struct {
		name       string
		req        *pb.PlaylistRequest
		setID      bool
		code       codes.Code
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.PlaylistRequest{
				Id: playlist.ID.String(),
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
				insertPlaylistIntoDB(t, client, playlist)
			},
		},
		{
			name: "no user id set",
			req: &pb.PlaylistRequest{
				Id: playlist.ID.String(),
			},
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name: "invalid playlist id",
			req: &pb.PlaylistRequest{
				Id: utils.RandStringRunes(8),
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
				insertUserIntoDB(t, client, account2)
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

			res, err := server.DeletePlaylist(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.GetName(), playlist.Name)
				require.Equal(t, res.Description, playlist.Description)
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
