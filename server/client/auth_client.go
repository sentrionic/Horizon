package client

import (
	"context"
	"github.com/sentrionic/horizon/pb"
	"time"

	"google.golang.org/grpc"
)

// AuthClient is a client to call authentication RPC
type AuthClient struct {
	service  pb.AuthClient
	email    string
	password string
}

// NewAuthClient returns a new auth client
func NewAuthClient(cc *grpc.ClientConn, email, password string) *AuthClient {
	service := pb.NewAuthClient(cc)
	return &AuthClient{service: service, email: email, password: password}
}

// Login login user and returns the access token
func (client *AuthClient) Login() (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	req := &pb.LoginRequest{
		Email:    client.email,
		Password: client.password,
	}

	res, err := client.service.Login(ctx, req)
	if err != nil {
		return "", err
	}

	return res.GetAccessToken(), nil
}
