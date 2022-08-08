package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/client"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/token"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/status"
	"log"
	"net"
	"testing"
	"time"
)

func TestNewAuthInterceptor(t *testing.T) {
	t.Parallel()

	config := utils.Config{TokenSymmetricKey: utils.RandStringRunes(32)}
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		log.Fatalln("cannot create token maker")
	}

	uid, err := uuid.NewUUID()
	require.NoError(t, err)

	serverAddress := startHealthServer(t, tokenMaker)

	testCases := []struct {
		name        string
		setupClient func(t *testing.T) pb.HealthCheckClient
		code        codes.Code
	}{
		{
			name: "OK",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				accessToken, err := tokenMaker.CreateToken(uid, horizon.UserRole, time.Minute)
				require.NoError(t, err)
				return newTestClient(t, serverAddress, accessToken, authorizationHeaderKey, true)
			},
			code: codes.OK,
		},
		{
			name: "NoAuthorization",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				return newTestClient(t, serverAddress, "", authorizationHeaderKey, true)
			},
			code: codes.Unauthenticated,
		},
		{
			name: "UnsupportedAuthorization",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				accessToken, err := tokenMaker.CreateToken(uid, horizon.UserRole, time.Minute)
				require.NoError(t, err)
				return newTestClient(t, serverAddress, accessToken, "unsupported", true)
			},
			code: codes.Unauthenticated,
		},
		{
			name: "NoMetadata",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				accessToken, err := tokenMaker.CreateToken(uid, horizon.UserRole, time.Minute)
				require.NoError(t, err)
				return newTestClient(t, serverAddress, accessToken, authorizationHeaderKey, false)
			},
			code: codes.Unauthenticated,
		},
		{
			name: "ExpiredToken",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				accessToken, err := tokenMaker.CreateToken(uid, horizon.UserRole, -time.Minute)
				require.NoError(t, err)
				return newTestClient(t, serverAddress, accessToken, authorizationHeaderKey, false)
			},
			code: codes.Unauthenticated,
		},
		{
			name: "InvalidRole",
			setupClient: func(t *testing.T) pb.HealthCheckClient {
				accessToken, err := tokenMaker.CreateToken(uid, horizon.AdminRole, time.Minute)
				require.NoError(t, err)
				return newTestClient(t, serverAddress, accessToken, authorizationHeaderKey, true)
			},
			code: codes.PermissionDenied,
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			req := &pb.PingRequest{
				Message: "Hello",
			}

			testClient := tc.setupClient(t)
			res, err := testClient.Ping(context.Background(), req)

			if tc.code == codes.OK {
				require.NoError(t, err)
				require.NotNil(t, res)
				require.Equal(t, res.GetMessage(), "Pong")
			} else {
				require.Error(t, err)
				require.Nil(t, res)
				st := status.Convert(err)
				require.Equal(t, tc.code, st.Code())
			}
		})
	}
}

func startHealthServer(t *testing.T, tokenMaker token.Maker) string {
	authInterceptor := NewAuthInterceptor(tokenMaker)

	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(authInterceptor.Unary()),
	)
	pb.RegisterHealthCheckServer(grpcServer, NewHealthCheckServer())

	listener, err := net.Listen("tcp", ":0") // random available port
	require.NoError(t, err)

	go func() {
		err := grpcServer.Serve(listener)
		if err != nil {
			log.Fatalln("error starting the grpc server")
		}
	}()

	return listener.Addr().String()
}

func newTestClient(t *testing.T, serverAddress, accessToken, authorizationType string, setupMetadata bool) pb.HealthCheckClient {
	ai := client.NewAuthInterceptor(
		accessToken,
		authorizationType,
		setupMetadata,
	)

	conn, err := grpc.Dial(serverAddress, grpc.WithTransportCredentials(insecure.NewCredentials()), grpc.WithUnaryInterceptor(ai.Unary()))
	require.NoError(t, err)
	return pb.NewHealthCheckClient(conn)
}
