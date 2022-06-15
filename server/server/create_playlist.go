package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func validateCreatePlaylistRequest(req *pb.CreatePlaylistRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidatePlaylistName(req.GetName()); err != nil {
		violations = append(violations, fieldViolation("name", err))
	}

	if err := validator.ValidatePlaylistDescription(req.Description); err != nil {
		violations = append(violations, fieldViolation("description", err))
	}

	return violations
}

func (server *PlaylistServer) CreatePlaylist(ctx context.Context, req *pb.CreatePlaylistRequest) (*pb.PlaylistResponse, error) {
	violations := validateCreatePlaylistRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	user, err := server.db.User.Query().Where(gen.IDEQ(*userId)).First(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	playlist, err := server.db.Playlist.Create().
		SetName(req.GetName()).
		SetNillableDescription(req.Description).
		SetUserID(*userId).
		Save(ctx)

	playlist.Edges.User = user

	if err != nil {
		return nil, status.Error(codes.Internal, "error creating the playlist")
	}

	return convertPlaylist(playlist, make([]*ent.Song, 0)), nil
}
