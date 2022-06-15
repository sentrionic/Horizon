package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// Playlist holds the schema definition for the Playlist entity.
type Playlist struct {
	ent.Schema
}

func (Playlist) Mixin() []ent.Mixin {
	return []ent.Mixin{
		TimeMixin{},
	}
}

// Fields of the Playlist.
func (Playlist) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			Immutable(),
		field.UUID("user_id", uuid.UUID{}),
		field.String("name").
			MinLen(3).
			MaxLen(30).
			NotEmpty(),
		field.String("description").
			Optional().
			Nillable(),
	}
}

func (Playlist) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("name", "user_id"),
	}
}

// Edges of the Playlist.
func (Playlist) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("user", User.Type).
			Ref("playlists").
			Field("user_id").
			Unique().
			Required(),
		edge.To("songs", PlaylistSong.Type).Annotations(entsql.Annotation{
			OnDelete: entsql.Cascade,
		}),
	}
}
