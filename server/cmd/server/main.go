package main

import (
	"context"
	"entgo.io/ent/dialect"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
	"github.com/sentrionic/horizon/ent"
	_ "github.com/sentrionic/horizon/ent/runtime"
	"github.com/sentrionic/horizon/server"
	"github.com/sentrionic/horizon/utils"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	log.Println("Starting server...")

	ctx := context.Background()

	// Load dev env from .env file
	if os.Getenv("MODE") != "release" {
		err := godotenv.Load()
		if err != nil {
			log.Fatalln("Error loading .env file")
		}
	}

	config, err := utils.LoadConfig(ctx)

	if err != nil {
		log.Fatalln("Could not load the config")
	}

	// initialize the db
	client, err := ent.Open(dialect.Postgres, config.DatabaseUrl, ent.Debug())

	if err != nil {
		log.Fatalf("failed connecting to postgres: %v", err)
	}

	defer func(client *ent.Client) {
		err = client.Close()
		if err != nil {
			log.Fatalf("failed to close the db client: %v", err)
		}
	}(client)

	// Run migration.
	if err = client.Schema.Create(ctx); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}

	if err = utils.SeedDatabase(ctx, config, client); err != nil {
		log.Printf("could not seed database: %v", err)
	}

	grpcServer := server.NewGrpcServer(config, client)

	listener, err := net.Listen("tcp", ":"+config.Port)
	if err != nil {
		log.Fatal("cannot start service: ", err)
	}

	// Graceful service shutdown
	go func() {
		if err = grpcServer.Serve(listener); err != nil {
			log.Fatalf("Failed to initialize service: %v\n", err)
		}
	}()

	log.Printf("Listening on port %v\n", listener.Addr())

	// Wait for kill signal of channel
	quit := make(chan os.Signal, 1)

	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)

	// This blocks until a signal is passed into the quit channel
	<-quit

	// Shutdown service
	log.Println("Shutting down service...")
	grpcServer.GracefulStop()
}
