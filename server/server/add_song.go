package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/playlist"
	sg "github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *PlaylistServer) AddSong(ctx context.Context, req *pb.PlaylistSongRequest) (*pb.SongResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	songId, err := uuid.Parse(req.GetSongId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid song id")
	}

	playlistId, err := uuid.Parse(req.GetPlaylistId())

	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid playlist id")
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

	song, err := server.db.Song.Query().WithUser().
		WithLikedBy().
		Where(sg.IDEQ(songId)).Only(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "no song found for the given id")
		}
		return nil, status.Error(codes.Internal, "error getting the song")
	}

	_, err = server.db.PlaylistSong.
		Create().
		SetSongID(song.ID).
		SetPlaylistID(playlist.ID).
		Save(ctx)

	if err != nil {
		return nil, status.Error(codes.Internal, "error adding the song to the db")
	}

	return convertSong(song, isLikedByUser(userId, song.Edges.LikedBy)), nil
}
