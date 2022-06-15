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

func TestPlaylistServer_CreatePlaylist(t *testing.T) {
	account, _ := randomUser(t)
	playlist := randomPlaylist(t, account.ID)
	invalidDescription := utils.RandStringRunes(160)

	testCases := []struct {
		name       string
		req        *pb.CreatePlaylistRequest
		setID      bool
		code       codes.Code
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.CreatePlaylistRequest{
				Name:        playlist.Name,
				Description: playlist.Description,
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name: "NameTooShort",
			req: &pb.CreatePlaylistRequest{
				Name:        utils.RandStringRunes(2),
				Description: playlist.Description,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "name",
		},
		{
			name: "DescriptionTooLong",
			req: &pb.CreatePlaylistRequest{
				Name:        playlist.Name,
				Description: &invalidDescription,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "description",
		},
		{
			name: "NoID",
			req: &pb.CreatePlaylistRequest{
				Name:        playlist.Name,
				Description: playlist.Description,
			},
			setID: false,
			code:  codes.Unauthenticated,
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

			res, err := server.CreatePlaylist(ctx, tc.req)

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
