package schema

import (
	"context"
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/alexedwards/argon2id"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	gen "github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/hook"
	"github.com/sentrionic/horizon/utils"
	"regexp"
)

var emailRegexp = regexp.MustCompile("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")

// User holds the schema definition for the User entity.
type User struct {
	ent.Schema
}

func (User) Mixin() []ent.Mixin {
	return []ent.Mixin{
		TimeMixin{},
	}
}

// Fields of the User.
func (User) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			Immutable(),
		field.String("username").
			Unique().
			MinLen(3).
			MaxLen(30).
			NotEmpty(),
		field.String("email").
			Match(emailRegexp).
			NotEmpty().
			Unique(),
		field.Text("password").
			MinLen(6).
			NotEmpty().
			Sensitive(),
		field.Text("image").
			NotEmpty(),
		field.Enum("role").GoType(horizon.Role("")).Default(string(horizon.UserRole)),
	}
}

// Edges of the User.
func (User) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("songs", Song.Type).
			Annotations(entsql.Annotation{
				OnDelete: entsql.Cascade,
			}),
		edge.To("playlists", Playlist.Type).Annotations(entsql.Annotation{
			OnDelete: entsql.Cascade,
		}),
		edge.To("likes", Like.Type).Annotations(entsql.Annotation{
			OnDelete: entsql.Cascade,
		}),
	}
}

func (User) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("username", "email").
			Unique(),
	}
}

func (User) Hooks() []ent.Hook {
	return []ent.Hook{
		hook.On(func(next ent.Mutator) ent.Mutator {
			return hook.UserFunc(func(ctx context.Context, mutation *gen.UserMutation) (gen.Value, error) {
				if password, ok := mutation.Password(); ok {
					hash, err := argon2id.CreateHash(password, argon2id.DefaultParams)
					if err != nil {
						return nil, err
					}

					mutation.SetPassword(hash)
				}

				if email, ok := mutation.Email(); ok {
					image := utils.GenerateAvatar(email)
					mutation.SetImage(image)
				}

				return next.Mutate(ctx, mutation)
			})
		}, ent.OpCreate|ent.OpUpdateOne),
	}
}
