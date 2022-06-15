package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
)

func TestArtistServer_GetArtist(t *testing.T) {
	artist, _ := randomUser(t)

	testCases := []struct {
		name   string
		req    *pb.ArtistRequest
		code   codes.Code
		before func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.ArtistRequest{
				Id: artist.ID.String(),
			},
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, artist)
			},
		},
		{
			name: "invalid artist id",
			req: &pb.ArtistRequest{
				Id: utils.RandStringRunes(8),
			},
			code: codes.InvalidArgument,
		},
		{
			name: "no artist found",
			req: &pb.ArtistRequest{
				Id: artist.ID.String(),
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

			server := newArtistServer(client)

			res, err := server.GetArtist(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
