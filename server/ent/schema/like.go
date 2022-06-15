package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"time"
)

// Like holds the schema definition for the Liked entity.
type Like struct {
	ent.Schema
}

// Fields of the Like.
func (Like) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("user_id", uuid.UUID{}),
		field.UUID("song_id", uuid.UUID{}),
		field.Time("date_added").
			Immutable().
			Default(time.Now),
	}
}

// Edges of the Like.
func (Like) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("user", User.Type).
			Ref("likes").
			Field("user_id").
			Unique().
			Required(),
		edge.From("song", Song.Type).
			Ref("liked_by").
			Field("song_id").
			Unique().
			Required(),
	}
}
