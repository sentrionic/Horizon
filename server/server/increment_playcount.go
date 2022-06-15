package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (s *SongServer) IncrementPlayCount(ctx context.Context, req *pb.SongRequest) (*pb.SongResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	songId, err := uuid.Parse(req.GetSongId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid song id")
	}

	song, err := s.db.Song.Query().WithUser().
		WithLikedBy().
		Where(gen.IDEQ(songId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no song found for the given id")
		}
		return nil, status.Error(codes.Internal, "error getting the song")
	}

	song.Plays += 1

	err = s.db.Song.UpdateOne(song).SetPlays(song.Plays).Exec(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error updating play count")
	}

	return convertSong(song, isLikedByUser(userId, song.Edges.LikedBy)), nil
}
