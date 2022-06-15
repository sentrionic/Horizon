package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/token"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
	"time"
)

func TestAuthServer_Current(t *testing.T) {
	account, _ := randomUser(t)
	id, err := uuid.NewUUID()
	require.NoError(t, err)
	account.ID = id

	cfg := utils.Config{
		TokenSymmetricKey:   utils.RandStringRunes(32),
		AccessTokenDuration: time.Minute,
	}

	manager, err := token.NewPasetoMaker(cfg.TokenSymmetricKey)
	require.NoError(t, err)

	testCases := []struct {
		name   string
		id     string
		setID  bool
		code   codes.Code
		before func(*testing.T, *ent.Client)
	}{
		{
			name:  "OK",
			id:    account.ID.String(),
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name:  "NoID",
			id:    account.ID.String(),
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name:  "NotFound",
			id:    account.ID.String(),
			setID: true,
			code:  codes.NotFound,
		},
		{
			name:  "InvalidID",
			id:    "",
			setID: true,
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
				ctx = context.WithValue(ctx, horizon.KeyUserID, tc.id)
			}

			server := newAuthServer(client, manager, cfg)

			res, err := server.Current(ctx, &pb.EmptyRequest{})

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.GetEmail(), account.Email)
				require.Equal(t, res.GetUsername(), account.Username)
				require.Equal(t, res.GetImage(), account.Image)
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}
