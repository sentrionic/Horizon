package server

import (
	"context"
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

func TestAuthServer_Login(t *testing.T) {
	user, password := randomUser(t)

	cfg := utils.Config{
		TokenSymmetricKey:   utils.RandStringRunes(32),
		AccessTokenDuration: time.Minute,
	}

	manager, err := token.NewPasetoMaker(cfg.TokenSymmetricKey)
	require.NoError(t, err)

	testCases := []struct {
		name       string
		req        *pb.LoginRequest
		code       codes.Code
		errorField string
		before     func(*testing.T, *ent.Client)
	}{
		{
			name: "OK",
			req: &pb.LoginRequest{
				Email:    user.Email,
				Password: password,
			},
			code: codes.OK,
			before: func(t *testing.T, client *ent.Client) {
				_, err := client.User.Create().
					SetUsername(user.Username).
					SetEmail(user.Email).
					SetPassword(password).
					Save(context.Background())
				require.NoError(t, err)
			},
		},
		{
			name: "InvalidEmail",
			req: &pb.LoginRequest{
				Email:    "bademail",
				Password: password,
			},
			code:       codes.InvalidArgument,
			errorField: "email",
		},
		{
			name: "UserNotFound",
			req: &pb.LoginRequest{
				Email:    user.Email,
				Password: password,
			},
			code: codes.NotFound,
		},
		{
			name: "IncorrectPassword",
			req: &pb.LoginRequest{
				Email:    user.Email,
				Password: password,
			},
			code: codes.NotFound,
			before: func(t *testing.T, client *ent.Client) {
				_, err := client.User.Create().
					SetUsername(user.Username).
					SetEmail(user.Email).
					SetPassword(utils.RandStringRunes(8)).
					Save(context.Background())
				require.NoError(t, err)
			},
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

			res, err := server.Login(context.Background(), tc.req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.Account.GetEmail(), user.Email)
				require.Equal(t, res.Account.GetUsername(), user.Username)
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
