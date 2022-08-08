package main

import (
	"context"
	"crypto/tls"
	"crypto/x509"
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/sentrionic/horizon/client"
	"github.com/sentrionic/horizon/utils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

func main() {
	ctx := context.Background()

	// Load dev env from .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatalln("Error loading .env file")
	}

	config, err := utils.LoadConfig(ctx)

	if err != nil {
		log.Fatalln("Error loading the config")
	}

	tlsCredentials, err := loadTLSCredentials()
	if err != nil {
		log.Fatal("cannot load TLS credentials: ", err)
	}

	c1, err := grpc.Dial(":"+config.Port, grpc.WithTransportCredentials(tlsCredentials))
	if err != nil {
		log.Fatal("cannot dial server: ", err)
	}

	authClient := client.NewAuthClient(c1, config.AdminEmail, config.AdminPassword)

	token, err := authClient.Login()

	if err != nil {
		log.Fatal("cannot login:", err)
	}

	interceptor := client.NewAuthInterceptor(token, "authorization", true)

	c2, err := grpc.Dial(
		":"+config.Port,
		grpc.WithTransportCredentials(tlsCredentials),
		grpc.WithUnaryInterceptor(interceptor.Unary()),
	)

	if err != nil {
		log.Fatal("cannot dial server: ", err)
	}

	songClient := client.NewSongClient(c2)

	const artistId = "Get manually from the DB or a network request"
	const title = "Song Title"
	const songPath = "path/to/the/song.mp3"
	songClient.UploadSong(artistId, title, songPath)
}

func loadTLSCredentials() (credentials.TransportCredentials, error) {
	pemServerCA, err := os.ReadFile("cert/ca-cert.pem")

	if err != nil {
		return nil, err
	}

	certPool := x509.NewCertPool()
	if !certPool.AppendCertsFromPEM(pemServerCA) {
		return nil, fmt.Errorf("failed to add server CA's certificate")
	}

	config := &tls.Config{
		RootCAs: certPool,
	}

	return credentials.NewTLS(config), nil
}
