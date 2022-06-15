package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlist"
	ps "github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *PlaylistServer) GetPlaylistSongs(ctx context.Context, req *pb.PlaylistRequest) (*pb.PlaylistSongList, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	playlistId, err := uuid.Parse(req.GetId())
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "not a valid playlist id")
	}

	playlist, err := server.db.Playlist.Query().Where(gen.IDEQ(playlistId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no playlist found for the given id")
		}
		return nil, status.Errorf(codes.Internal, "could not find the playlist")
	}

	if playlist.UserID != *userId {
		return nil, status.Errorf(codes.PermissionDenied, "not the playlist owner")
	}

	songs, err := server.db.PlaylistSong.
		Query().
		Where(ps.PlaylistIDEQ(playlistId)).
		QuerySong().
		WithUser().
		WithLikedBy().
		All(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error retrieving songs")
	}

	res := make([]*pb.PlaylistSongResponse, 0)

	for _, song := range songs {
		psSong, _ := server.db.PlaylistSong.Query().Where(ps.And(
			ps.SongIDEQ(song.ID), ps.PlaylistID(playlistId))).First(ctx)
		res = append(res, convertPlaylistSong(song, isLikedByUser(userId, song.Edges.LikedBy), psSong.DateAdded))
	}

	return &pb.PlaylistSongList{Songs: res}, nil
}
