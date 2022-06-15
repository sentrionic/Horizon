# Horizon - Server

The server written using Go.

# Stack

- The default gRPC server
- [Ent](https://entgo.io/) as the database ORM
- PostgreSQL to save all the data
- [Paseto](https://github.com/paragonie/paseto) Token for authentication
- [AWS S3](https://aws.amazon.com/s3/) for storing the songs

# Installation

(If you are familiar with `make`, take a look at the `Makefile` to quickly setup the following steps)

1. Install Docker and get the Postgresql container (`make postgres`)
2. Start the Postgresql container and create a DB (`make createdb`)
3. Install Go (1.18) and get all the dependencies (`go mod tidy`)
4. Rename `.env.example` to `.env` and fill in the values
5. Run `go run github.com/sentrionic/horizon/cmd/server` to run the server

# Development

- Install [protoc](https://grpc.io/docs/protoc-installation/)
- Install `protoc-gen-go`, `protoc-gen-go-grpc` and `protoc-gen-dart`

```bash
go get google.golang.org/protobuf/cmd/protoc-gen-go
go get google.golang.org/grpc/cmd/protoc-gen-go-grpc
dart pub global activate protoc_plugin
```

- To generate code from the proto files, run `make gen`
  - This automatically runs `make clean` which deletes all files in the `pb` directory.

# Testing

1. Run `go test -v -cover ./...` (`make test`)

# Uploading Songs

1. Setup S3 or change the code so it stores and servers the files locally.
2. Create the artist's account (e.g. with a `Register` request).
3. Fill in the values for `artistId`, `title` and `songPath` in `cmd/client/main.go`.
4. Run `go run github.com/sentrionic/horizon/cmd/server` to run the server.
5. Run `go run github.com/sentrionic/horizon/cmd/client` to upload the song.

# Generating Certs

This app uses server-side TLS (see the `cert` directory).

1. Run `cd cert`
2. Run `./gen.sh` using Git Bash. This also replaces the cert inside the app directory.

# Credits

[Tech School](https://github.com/techschool/): The server is based on his tutorials.
