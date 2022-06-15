package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func validateUpdateSongRequest(req *pb.UpdateSongRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateTitle(req.GetTitle()); err != nil {
		violations = append(violations, fieldViolation("title", err))
	}

	return violations
}

func (s *SongServer) UpdateSong(ctx context.Context, req *pb.UpdateSongRequest) (*pb.SongResponse, error) {
	violations := validateUpdateSongRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	songId, err := uuid.Parse(req.GetSongId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid song id")
	}

	_, err = s.db.Song.UpdateOneID(songId).
		SetTitle(req.GetTitle()).
		Save(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error updating the songs")
	}

	song, err := s.db.Song.Query().
		WithUser().
		WithLikedBy().
		Where(gen.IDEQ(songId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no song found for the given id")
		}
		return nil, status.Error(codes.Internal, "error getting the song")
	}

	return convertSong(song, isLikedByUser(userId, song.Edges.LikedBy)), nil
}
