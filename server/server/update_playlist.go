package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func validateUpdatePlaylistRequest(req *pb.UpdatePlaylistRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidatePlaylistName(req.GetName()); err != nil {
		violations = append(violations, fieldViolation("name", err))
	}

	if err := validator.ValidatePlaylistDescription(req.Description); err != nil {
		violations = append(violations, fieldViolation("description", err))
	}

	return violations
}

func (server *PlaylistServer) UpdatePlaylist(ctx context.Context, req *pb.UpdatePlaylistRequest) (*pb.PlaylistResponse, error) {
	violations := validateUpdatePlaylistRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	playlistId, err := uuid.Parse(req.GetPlaylistId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid playlist id")
	}

	playlist, err := server.db.Playlist.
		Query().
		WithUser().
		Where(gen.IDEQ(playlistId)).
		Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no playlist found for the given id")
		}
		return nil, status.Errorf(codes.Internal, "could not find the playlist")
	}

	if playlist.UserID != *userId {
		return nil, status.Errorf(codes.PermissionDenied, "not the playlist owner")
	}

	playlist.Name = req.GetName()
	playlist.Description = req.Description

	err = playlist.Update().SetName(playlist.Name).SetNillableDescription(playlist.Description).Exec(ctx)

	if err != nil {
		return nil, status.Errorf(codes.Internal, "error updating the playlist")
	}

	return convertPlaylist(playlist, make([]*ent.Song, 0)), nil
}
