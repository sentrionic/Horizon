package server

import (
	"context"
	"crypto/tls"
	"errors"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/token"
	"github.com/sentrionic/horizon/utils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/reflection"
	"log"
)

func NewGrpcServer(config utils.Config, client *ent.Client) *grpc.Server {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		log.Fatalln("cannot create token maker")
	}

	fs, err := utils.NewFileStore(config)

	if err != nil {
		log.Printf("could not create the file store: %s", err)
	}

	authServer := newAuthServer(client, tokenMaker, config)
	songServer := newSongServer(client, fs)
	artistServer := newArtistServer(client)
	playlistServer := newPlaylistServer(client)

	authInterceptor := NewAuthInterceptor(tokenMaker)

	tlsCredentials, err := loadTLSCredentials()
	if err != nil {
		log.Fatal("cannot load TLS credentials: ", err)
	}

	grpcServer := grpc.NewServer(
		grpc.Creds(tlsCredentials),
		grpc.UnaryInterceptor(authInterceptor.Unary()),
	)

	pb.RegisterAuthServer(grpcServer, authServer)
	pb.RegisterSongServer(grpcServer, songServer)
	pb.RegisterArtistServer(grpcServer, artistServer)
	pb.RegisterPlaylistServer(grpcServer, playlistServer)
	reflection.Register(grpcServer)

	return grpcServer
}

type AuthServer struct {
	pb.UnimplementedAuthServer
	db         *ent.Client
	tokenMaker token.Maker
	config     utils.Config
}

func newAuthServer(client *ent.Client, tokenMaker token.Maker, config utils.Config) *AuthServer {
	return &AuthServer{db: client, tokenMaker: tokenMaker, config: config}
}

type SongServer struct {
	pb.UnimplementedSongServer
	db *ent.Client
	fs utils.FileRepository
}

func newSongServer(client *ent.Client, fs utils.FileRepository) *SongServer {
	return &SongServer{db: client, fs: fs}
}

type ArtistServer struct {
	pb.UnimplementedArtistServer
	db *ent.Client
}

func newArtistServer(client *ent.Client) *ArtistServer {
	return &ArtistServer{db: client}
}

type PlaylistServer struct {
	pb.UnimplementedPlaylistServer
	db *ent.Client
}

func newPlaylistServer(client *ent.Client) *PlaylistServer {
	return &PlaylistServer{db: client}
}

type HealthCheckServer struct {
	pb.UnimplementedHealthCheckServer
}

func (h HealthCheckServer) Ping(_ context.Context, _ *pb.PingRequest) (*pb.PingRequest, error) {
	return &pb.PingRequest{Message: "Pong"}, nil
}

func NewHealthCheckServer() *HealthCheckServer {
	return &HealthCheckServer{}
}

func getUserIDFromContext(ctx context.Context) (*uuid.UUID, error) {
	keyId := ctx.Value(horizon.KeyUserID)

	if keyId == nil {
		return nil, errors.New("no key set in context")
	}

	userId, err := uuid.Parse(keyId.(string))

	if err != nil {
		return nil, errors.New("not a valid uuid")
	}

	return &userId, nil
}

func loadTLSCredentials() (credentials.TransportCredentials, error) {
	// Load server's certificate and private key
	serverCert, err := tls.LoadX509KeyPair("cert/server-cert.pem", "cert/server-key.pem")
	if err != nil {
		return nil, err
	}

	// Create the credentials and return it
	config := &tls.Config{
		Certificates: []tls.Certificate{serverCert},
		ClientAuth:   tls.NoClientCert,
	}

	return credentials.NewTLS(config), nil
}
