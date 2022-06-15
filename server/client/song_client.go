package client

import (
	"bufio"
	"context"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc"
	"io"
	"log"
	"os"
	"time"
)

// SongClient is a client to call song service RPCs
type SongClient struct {
	client pb.SongClient
}

// NewSongClient returns a new song client
func NewSongClient(cc *grpc.ClientConn) *SongClient {
	client := pb.NewSongClient(cc)
	return &SongClient{client}
}

func (c *SongClient) UploadSong(artistId, title, songPath string) {
	file, err := os.Open(songPath)
	if err != nil {
		log.Fatal("cannot open song file: ", err)
	}
	defer file.Close()

	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	stream, err := c.client.CreateSong(ctx)
	if err != nil {
		log.Fatal("cannot upload song: ", err)
	}

	req := &pb.CreateSongRequest{
		Data: &pb.CreateSongRequest_Details{
			Details: &pb.SongDetails{
				Title:    title,
				ArtistId: artistId,
			},
		},
	}

	err = stream.Send(req)
	if err != nil {
		log.Fatal("cannot send song info to server: ", err, stream.RecvMsg(nil))
	}

	reader := bufio.NewReader(file)
	buffer := make([]byte, 1024)

	for {
		n, err := reader.Read(buffer)
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal("cannot read chunk to buffer: ", err)
		}

		req := &pb.CreateSongRequest{
			Data: &pb.CreateSongRequest_ChunkData{
				ChunkData: buffer[:n],
			},
		}

		err = stream.Send(req)
		if err != nil {
			log.Fatal("cannot send chunk to server: ", err, stream.RecvMsg(nil))
		}
	}

	res, err := stream.CloseAndRecv()
	if err != nil {
		log.Fatal("cannot receive response: ", err)
	}

	log.Printf("song uploaded with id: %s", res)
}
