package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/like"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (s *SongServer) ToggleLike(ctx context.Context, req *pb.SongRequest) (*pb.SongResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	songId, err := uuid.Parse(req.GetSongId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid song id")
	}

	song, err := s.db.Song.Query().WithUser().Where(gen.IDEQ(songId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no song found for the given id")
		}
		return nil, status.Error(codes.Internal, "error getting the songs")
	}

	result, err := s.db.Like.Query().
		Where(
			like.And(
				like.UserIDEQ(*userId),
				like.SongIDEQ(song.ID)),
		).First(ctx)

	if err != nil {
		// Like does not exist, so create it
		if ent.IsNotFound(err) {
			_, err = s.db.Like.Create().SetSongID(song.ID).SetUserID(*userId).Save(ctx)
			if err != nil {
				return nil, status.Error(codes.Internal, "error setting the like")
			}
			return convertSong(song, true), nil
		}
		return nil, status.Error(codes.Internal, "error getting the like status")
	}

	// Like already exists, remove it
	err = s.db.Like.DeleteOne(result).Exec(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error removing the like")
	}

	return convertSong(song, false), nil
}
