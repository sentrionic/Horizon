package server

import (
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"time"
)

func convertAccount(user *ent.User) *pb.AccountResponse {
	return &pb.AccountResponse{
		Id:       user.ID.String(),
		Username: user.Username,
		Email:    user.Email,
		Image:    user.Image,
	}
}

func convertSong(song *ent.Song, isLiked bool) *pb.SongResponse {
	return &pb.SongResponse{
		Id:       song.ID.String(),
		Title:    song.Title,
		Url:      song.URL,
		Duration: song.Duration,
		Plays:    song.Plays,
		IsLiked:  isLiked,
		Artist:   convertArtist(song.Edges.User),
	}
}

func convertPlaylistSong(song *ent.Song, isLiked bool, dateAdded time.Time) *pb.PlaylistSongResponse {
	return &pb.PlaylistSongResponse{
		Id:        song.ID.String(),
		Title:     song.Title,
		Url:       song.URL,
		Duration:  song.Duration,
		DateAdded: dateAdded.Format("2006-01-02T15:04:05-0700"),
		IsLiked:   isLiked,
		Artist:    convertArtist(song.Edges.User),
	}
}

func convertArtist(user *ent.User) *pb.ArtistResponse {
	return &pb.ArtistResponse{
		Id:       user.ID.String(),
		Username: user.Username,
		Image:    user.Image,
	}
}

func convertPlaylist(playlist *ent.Playlist, songs []*ent.Song) *pb.PlaylistResponse {
	return &pb.PlaylistResponse{
		Id:          playlist.ID.String(),
		Name:        playlist.Name,
		Description: playlist.Description,
		Owner:       playlist.Edges.User.Username,
		Duration:    getPlaylistDuration(songs),
		SongCount:   uint32(len(songs)),
	}
}

func getPlaylistDuration(songs []*ent.Song) uint32 {
	var sum uint32 = 0
	for _, s := range songs {
		sum += s.Duration
	}
	return sum
}
