package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"time"
)

// PlaylistSong holds the schema definition for the PlaylistSong entity.
type PlaylistSong struct {
	ent.Schema
}

// Fields of the PlaylistSong.
func (PlaylistSong) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("playlist_id", uuid.UUID{}),
		field.UUID("song_id", uuid.UUID{}),
		field.Time("date_added").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the PlaylistSong.
func (PlaylistSong) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("playlist", Playlist.Type).
			Ref("songs").
			Field("playlist_id").
			Unique().
			Required(),
		edge.From("song", Song.Type).
			Ref("playlists").
			Field("song_id").
			Unique().
			Required(),
	}
}
