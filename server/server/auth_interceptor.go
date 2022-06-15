package server

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/token"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"log"
	"time"
)

const authorizationHeaderKey = "authorization"

func authRoutes() map[string][]horizon.Role {
	const authServicePath = "/pb.Auth/"
	const songServicePath = "/pb.Song/"
	const artistServicePath = "/pb.Artist/"
	const playlistServicePath = "/pb.Playlist/"

	return map[string][]horizon.Role{
		artistServicePath + "SearchArtists":      {horizon.UserRole},
		artistServicePath + "GetArtist":          {horizon.UserRole},
		authServicePath + "Current":              {horizon.UserRole},
		authServicePath + "Update":               {horizon.UserRole},
		songServicePath + "GetSongs":             {horizon.UserRole},
		songServicePath + "GetLikedSongs":        {horizon.UserRole},
		songServicePath + "CreateSong":           {horizon.AdminRole},
		songServicePath + "UpdateSong":           {horizon.AdminRole},
		songServicePath + "DeleteSong":           {horizon.AdminRole},
		songServicePath + "ToggleLike":           {horizon.UserRole},
		songServicePath + "IncrementPlayCount":   {horizon.UserRole},
		playlistServicePath + "GetPlaylistSongs": {horizon.UserRole},
		playlistServicePath + "GetPlaylists":     {horizon.UserRole},
		playlistServicePath + "AddSong":          {horizon.UserRole},
		playlistServicePath + "RemoveSong":       {horizon.UserRole},
		playlistServicePath + "CreatePlaylist":   {horizon.UserRole},
		playlistServicePath + "DeletePlaylist":   {horizon.UserRole},
		playlistServicePath + "UpdatePlaylist":   {horizon.UserRole},
		"/pb.HealthCheck/Ping":                   {horizon.UserRole},
	}
}

// AuthInterceptor is a service interceptor for authentication and authorization
type AuthInterceptor struct {
	tokenMaker token.Maker
}

// NewAuthInterceptor returns a new auth interceptor
func NewAuthInterceptor(tokenMaker token.Maker) *AuthInterceptor {
	return &AuthInterceptor{tokenMaker}
}

// Unary returns a service interceptor function to authenticate and authorize unary RPC
func (interceptor *AuthInterceptor) Unary() grpc.UnaryServerInterceptor {
	return func(
		ctx context.Context,
		req any,
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (any, error) {
		log.Printf("Method %s called at %v", info.FullMethod, time.Now())
		userId, err := interceptor.authorize(ctx, info.FullMethod)
		if err != nil {
			return nil, err
		}

		ctx = context.WithValue(ctx, horizon.KeyUserID, userId)

		return handler(ctx, req)
	}
}

// Stream returns a service interceptor function to authenticate and authorize stream RPC
func (interceptor *AuthInterceptor) Stream() grpc.StreamServerInterceptor {
	return func(
		srv any,
		stream grpc.ServerStream,
		info *grpc.StreamServerInfo,
		handler grpc.StreamHandler,
	) error {
		_, err := interceptor.authorize(stream.Context(), info.FullMethod)
		if err != nil {
			return err
		}

		return handler(srv, stream)
	}
}

func (interceptor *AuthInterceptor) authorize(ctx context.Context, method string) (string, error) {
	accessibleRoles, ok := authRoutes()[method]
	if !ok {
		// everyone can access
		return "", nil
	}

	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return "", status.Errorf(codes.Unauthenticated, "metadata is not provided")
	}

	values := md[authorizationHeaderKey]
	if len(values) == 0 {
		return "", status.Errorf(codes.Unauthenticated, "authorization token is not provided")
	}

	accessToken := values[0]
	claims, err := interceptor.tokenMaker.VerifyToken(accessToken)
	if err != nil {
		return "", status.Errorf(codes.Unauthenticated, "access token is invalid: %v", err)
	}

	for _, role := range accessibleRoles {
		if string(role) == claims.Role {
			return claims.UserID, nil
		}
	}

	return "", status.Error(codes.PermissionDenied, "no permission to access this RPC")
}
