package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *PlaylistServer) DeletePlaylist(ctx context.Context, req *pb.PlaylistRequest) (*pb.PlaylistResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	playlistId, err := uuid.Parse(req.GetId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid playlist id")
	}

	playlist, err := server.db.Playlist.Query().WithUser().Where(gen.IDEQ(playlistId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no playlist found for the given id")
		}
		return nil, status.Errorf(codes.Internal, "could not find the playlist")
	}

	if playlist.UserID != *userId {
		return nil, status.Errorf(codes.PermissionDenied, "not the playlist owner")
	}

	err = server.db.Playlist.DeleteOne(playlist).Exec(ctx)

	if err != nil {
		return nil, status.Errorf(codes.Internal, "error deleting the playlist")
	}

	return convertPlaylist(playlist, make([]*ent.Song, 0)), nil
}
