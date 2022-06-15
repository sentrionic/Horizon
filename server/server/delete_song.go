package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"strings"
)

func (s *SongServer) DeleteSong(ctx context.Context, req *pb.SongRequest) (*pb.SongResponse, error) {
	songId, err := uuid.Parse(req.GetSongId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid song id")
	}

	song, err := s.db.Song.Query().WithUser().Where(gen.IDEQ(songId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no song found for the given id")
		}
		return nil, status.Error(codes.Internal, "error getting the song")
	}

	key := song.URL[strings.LastIndex(song.URL, "/")+1:]
	err = s.fs.DeleteSong(key)

	if err != nil {
		return nil, status.Error(codes.Internal, "error deleting the song file")
	}

	err = s.db.Song.DeleteOne(song).Exec(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error deleting the song")
	}

	return convertSong(song, false), nil
}
