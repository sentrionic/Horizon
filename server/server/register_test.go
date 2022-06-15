package server

import (
	"context"
	_ "github.com/mattn/go-sqlite3"
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

func TestAuthServer_Register(t *testing.T) {
	user, password := randomUser(t)

	cfg := utils.Config{
		TokenSymmetricKey:   utils.RandStringRunes(32),
		AccessTokenDuration: time.Minute,
	}

	manager, err := token.NewPasetoMaker(cfg.TokenSymmetricKey)
	require.NoError(t, err)

	testCases := []struct {
		name       string
		req        *pb.RegisterRequest
		code       codes.Code
		errorField string
		before     func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.RegisterRequest{
				Email:    user.Email,
				Username: user.Username,
				Password: password,
			},
			code: codes.OK,
		},
		{
			name: "InvalidEmail",
			req: &pb.RegisterRequest{
				Email:    "bademail",
				Username: user.Username,
				Password: password,
			},
			code:       codes.InvalidArgument,
			errorField: "email",
		},
		{
			name: "DuplicateUsername",
			req: &pb.RegisterRequest{
				Email:    user.Email,
				Username: user.Username,
				Password: password,
			},
			code: codes.PermissionDenied,
			before: func(t *testing.T, client *ent.Client) {
				account, _ := randomUser(t)
				account.Username = user.Username
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name: "DuplicateEmail",
			req: &pb.RegisterRequest{
				Email:    user.Email,
				Username: user.Username,
				Password: password,
			},
			code: codes.PermissionDenied,
			before: func(t *testing.T, client *ent.Client) {
				account, _ := randomUser(t)
				account.Email = user.Email
				insertUserIntoDB(t, client, account)
			},
		},
		{
			name: "InvalidUsername",
			req: &pb.RegisterRequest{
				Email:    user.Email,
				Username: utils.RandStringRunes(2),
				Password: password,
			},
			code:       codes.InvalidArgument,
			errorField: "username",
		},
		{
			name: "PasswordTooShort",
			req: &pb.RegisterRequest{
				Email:    user.Email,
				Username: user.Username,
				Password: utils.RandStringRunes(5),
			},
			code:       codes.InvalidArgument,
			errorField: "password",
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			client := setupTestDB(t)
			defer client.Close()

			if tc.before != nil {
				tc.before(t, client)
			}

			server := newAuthServer(client, manager, cfg)

			res, err := server.Register(context.Background(), tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.Account.GetEmail(), tc.req.GetEmail())
				require.Equal(t, res.Account.GetUsername(), tc.req.GetUsername())
				require.Equal(t, res.Account.GetImage(), user.Image)
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
