package server

import (
	"context"
	ls "github.com/sentrionic/horizon/ent/like"
	"github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (s *SongServer) GetLikedSongs(ctx context.Context, filter *pb.Filter) (*pb.PlaylistSongList, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	current, err := s.db.User.Query().Where(user.ID(*userId)).Only(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error getting the user")
	}

	songs, err := current.
		QueryLikes().
		QuerySong().
		WithUser().
		WithLikedBy().
		Limit(int(filter.Limit)).
		Offset(int(filter.Page) * int(filter.Limit)).
		All(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error retrieving songs")
	}

	res := make([]*pb.PlaylistSongResponse, 0)

	for _, song := range songs {
		lsSong, _ := s.db.Like.Query().Where(ls.And(
			ls.SongIDEQ(song.ID), ls.UserIDEQ(*userId))).First(ctx)
		res = append(res, convertPlaylistSong(song, isLikedByUser(userId, song.Edges.LikedBy), lsSong.DateAdded))
	}

	return &pb.PlaylistSongList{Songs: res}, nil
}
