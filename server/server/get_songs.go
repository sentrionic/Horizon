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

func validateSongFilter(req *pb.Filter) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateOrder(req.Order); err != nil {
		violations = append(violations, fieldViolation("order", err))
	}

	return violations
}

func (s *SongServer) GetSongs(ctx context.Context, filter *pb.Filter) (*pb.SongList, error) {
	violations := validateSongFilter(filter)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	query := s.db.Song.Query().
		WithUser().
		WithLikedBy().
		Order(getSongOrderQuery(filter.Order)).
		Limit(int(filter.Limit)).
		Offset(int(filter.Page) * int(filter.Limit))

	if filter.Query != nil {
		query.Where(gen.TitleContainsFold(filter.GetQuery()))
	}

	if filter.ArtistId != nil {
		artistId, err := uuid.Parse(filter.GetArtistId())
		if err != nil {
			return nil, status.Error(codes.InvalidArgument, "not a valid user id")
		}
		query.Where(gen.ArtistID(artistId))
	}

	songs, err := query.All(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error retrieving songs")
	}

	res := make([]*pb.SongResponse, 0)

	for _, song := range songs {
		res = append(res, convertSong(song, isLikedByUser(userId, song.Edges.LikedBy)))
	}

	return &pb.SongList{Songs: res}, nil
}

func isLikedByUser(userId *uuid.UUID, likes []*ent.Like) bool {
	for _, l := range likes {
		if l.UserID == *userId {
			return true
		}
	}
	return false
}

func getSongOrderQuery(order *string) ent.OrderFunc {
	if order == nil {
		return ent.Desc(gen.FieldCreatedAt)
	}
	if *order == gen.FieldCreatedAt {
		return ent.Asc(gen.FieldCreatedAt)
	}
	if *order == gen.FieldPlays {
		return ent.Desc(gen.FieldPlays)
	}
	return ent.Desc(gen.FieldCreatedAt)
}
