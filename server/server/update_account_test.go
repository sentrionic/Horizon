package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/token"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"testing"
	"time"
)

func TestAccountServer_UpdateAccount(t *testing.T) {
	account, _ := randomUser(t)

	newName := utils.Username()
	newEmail := utils.Email()

	cfg := utils.Config{
		TokenSymmetricKey:   utils.RandStringRunes(32),
		AccessTokenDuration: time.Minute,
	}

	manager, err := token.NewPasetoMaker(cfg.TokenSymmetricKey)
	require.NoError(t, err)

	testCases := []struct {
		name       string
		req        *pb.UpdateRequest
		setID      bool
		code       codes.Code
		before     func(*testing.T, *ent.Client)
		errorField string
	}{
		{
			name: "OK",
			req: &pb.UpdateRequest{
				Username: newName,
				Email:    newEmail,
			},
			setID: true,
			code:  codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name: "username too short",
			req: &pb.UpdateRequest{
				Username: utils.RandStringRunes(2),
				Email:    newEmail,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "username",
		},
		{
			name: "invalid email",
			req: &pb.UpdateRequest{
				Email:    "bademail",
				Username: newName,
			},
			setID:      true,
			code:       codes.InvalidArgument,
			errorField: "email",
		},
		{
			name: "no id set in context",
			req: &pb.UpdateRequest{
				Username: newName,
				Email:    newEmail,
			},
			setID: false,
			code:  codes.Unauthenticated,
		},
		{
			name: "Duplicate Username",
			req: &pb.UpdateRequest{
				Username: newName,
				Email:    newEmail,
			},
			setID: true,
			code:  codes.PermissionDenied,
			before: func(t *testing.T, client *ent.Client) {
				artist, _ := randomUser(t)
				artist.Username = newName
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
			},
		},
		{
			name: "Duplicate Email",
			req: &pb.UpdateRequest{
				Username: newName,
				Email:    newEmail,
			},
			setID: true,
			code:  codes.PermissionDenied,
			before: func(t *testing.T, client *ent.Client) {
				artist, _ := randomUser(t)
				artist.Email = newEmail
				insertUserIntoDB(t, client, account)
				insertUserIntoDB(t, client, artist)
			},
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

			server := newAuthServer(client, manager, cfg)

			res, err := server.Update(ctx, tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.GetUsername(), newName)
				require.Equal(t, res.GetEmail(), newEmail)

				u, err := client.User.Query().Where(gen.IDEQ(account.ID)).First(ctx)
				require.NoError(t, err)
				require.Equal(t, u.Username, newName)
				require.Equal(t, u.Email, newEmail)
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
