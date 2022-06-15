package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// Song holds the schema definition for the Song entity.
type Song struct {
	ent.Schema
}

func (Song) Mixin() []ent.Mixin {
	return []ent.Mixin{
		TimeMixin{},
	}
}

// Fields of the Song.
func (Song) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			Immutable(),
		field.UUID("artist_id", uuid.UUID{}),
		field.String("title").
			MinLen(3).
			MaxLen(30).
			NotEmpty(),
		field.String("url").
			NotEmpty(),
		field.Uint32("plays").
			Default(0),
		field.Uint32("duration"),
	}
}

func (Song) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("title", "artist_id"),
	}
}

// Edges of the Song.
func (Song) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("user", User.Type).
			Ref("songs").
			Field("artist_id").
			Unique().
			Required(),
		edge.To("liked_by", Like.Type).
			Annotations(entsql.Annotation{
				OnDelete: entsql.Cascade,
			}),
		edge.To("playlists", PlaylistSong.Type).Annotations(entsql.Annotation{
			OnDelete: entsql.Cascade,
		}),
	}
}
