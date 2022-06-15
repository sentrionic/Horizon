package server

import (
	"bytes"
	"context"
	"fmt"
	"github.com/google/uuid"
	"github.com/hajimehoshi/go-mp3"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"io"
	"log"
)

func validateCreateSongRequest(req *pb.CreateSongRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateTitle(req.GetDetails().GetTitle()); err != nil {
		violations = append(violations, fieldViolation("title", err))
	}

	return violations
}

func (s *SongServer) CreateSong(stream pb.Song_CreateSongServer) error {

	// Get Song Details
	req, err := stream.Recv()
	if err != nil {
		return logError(status.Errorf(codes.Unknown, "cannot receive song info"))
	}

	violations := validateCreateSongRequest(req)
	if violations != nil {
		return invalidArgumentError(violations)
	}

	// Check if the provided artist exists
	artistId, err := uuid.Parse(req.GetDetails().GetArtistId())

	if err != nil {
		return status.Errorf(codes.InvalidArgument, "invalid artist id")
	}

	songData := bytes.Buffer{}

	// Get the uploaded song in chunks
	for {
		err := contextError(stream.Context())
		if err != nil {
			fmt.Println(err)
			return err
		}

		req, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			return logError(status.Errorf(codes.Unknown, "cannot receive chunk data: %v", err))
		}

		chunk := req.GetChunkData()
		_, err = songData.Write(chunk)
		if err != nil {
			return logError(status.Errorf(codes.Internal, "cannot write chunk data: %v", err))
		}
	}

	// Upload to the storage
	url, err := s.fs.UploadSong(songData, artistId.String(), req.GetDetails().Title)

	if err != nil {
		return status.Errorf(codes.Internal, "error uploading the file")
	}

	// Get the songs duration
	duration, err := getSongDuration(songData)

	if err != nil {
		return status.Errorf(codes.Internal, "error getting the song duration")
	}

	song, err := s.db.Song.Create().
		SetArtistID(artistId).
		SetTitle(req.GetDetails().GetTitle()).
		SetURL(url).
		SetDuration(uint32(duration)).
		Save(stream.Context())

	if err != nil {
		if ent.IsNotFound(err) {
			return status.Error(codes.NotFound, "no song found for the given id")
		}
		return logError(status.Errorf(codes.Internal, "error saving song in db: %v", err))
	}

	// Set the song's artist
	artist, err := s.db.User.Query().Where(user.IDEQ(artistId)).Only(stream.Context())

	if err != nil {
		return logError(status.Errorf(codes.Internal, "error getting the artist: %v", err))
	}

	song.Edges.User = artist

	err = stream.SendAndClose(convertSong(song, false))

	if err != nil {
		return logError(status.Errorf(codes.Internal, "error closing stream: %v", err))
	}

	return nil
}

const sampleSize = 4

func getSongDuration(songData bytes.Buffer) (int64, error) {
	reader := bytes.NewReader(songData.Bytes())
	d, err := mp3.NewDecoder(reader)

	if err != nil {
		return 0, err
	}

	samples := d.Length() / sampleSize

	return samples / int64(d.SampleRate()), nil
}

func contextError(ctx context.Context) error {
	switch ctx.Err() {
	case context.Canceled:
		return logError(status.Error(codes.Canceled, "request is canceled"))
	case context.DeadlineExceeded:
		return logError(status.Error(codes.DeadlineExceeded, "deadline is exceeded"))
	default:
		return nil
	}
}

func logError(err error) error {
	if err != nil {
		log.Print(err)
	}
	return err
}
