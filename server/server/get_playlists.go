package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *PlaylistServer) GetPlaylists(ctx context.Context, _ *pb.GetPlaylistRequest) (*pb.PlaylistListResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	playlists, err := server.db.Playlist.
		Query().
		Where(playlist.UserIDEQ(*userId)).
		WithUser().
		Order(ent.Desc(playlist.FieldCreatedAt)).
		All(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error fetching the user's playlists")
	}

	res := make([]*pb.PlaylistResponse, 0)

	for _, pl := range playlists {
		songs, _ := pl.QuerySongs().QuerySong().All(ctx)
		res = append(res, convertPlaylist(pl, songs))
	}

	return &pb.PlaylistListResponse{Playlists: res}, nil
}
