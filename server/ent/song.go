// Code generated by ent, DO NOT EDIT.

package ent

import (
	"fmt"
	"strings"
	"time"

	"entgo.io/ent/dialect/sql"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/ent/user"
)

// Song is the model entity for the Song schema.
type Song struct {
	config `json:"-"`
	// ID of the ent.
	ID uuid.UUID `json:"id,omitempty"`
	// CreatedAt holds the value of the "created_at" field.
	CreatedAt time.Time `json:"created_at,omitempty"`
	// UpdatedAt holds the value of the "updated_at" field.
	UpdatedAt time.Time `json:"updated_at,omitempty"`
	// ArtistID holds the value of the "artist_id" field.
	ArtistID uuid.UUID `json:"artist_id,omitempty"`
	// Title holds the value of the "title" field.
	Title string `json:"title,omitempty"`
	// URL holds the value of the "url" field.
	URL string `json:"url,omitempty"`
	// Plays holds the value of the "plays" field.
	Plays uint32 `json:"plays,omitempty"`
	// Duration holds the value of the "duration" field.
	Duration uint32 `json:"duration,omitempty"`
	// Edges holds the relations/edges for other nodes in the graph.
	// The values are being populated by the SongQuery when eager-loading is set.
	Edges SongEdges `json:"edges"`
}

// SongEdges holds the relations/edges for other nodes in the graph.
type SongEdges struct {
	// User holds the value of the user edge.
	User *User `json:"user,omitempty"`
	// LikedBy holds the value of the liked_by edge.
	LikedBy []*Like `json:"liked_by,omitempty"`
	// Playlists holds the value of the playlists edge.
	Playlists []*PlaylistSong `json:"playlists,omitempty"`
	// loadedTypes holds the information for reporting if a
	// type was loaded (or requested) in eager-loading or not.
	loadedTypes [3]bool
}

// UserOrErr returns the User value or an error if the edge
// was not loaded in eager-loading, or loaded but was not found.
func (e SongEdges) UserOrErr() (*User, error) {
	if e.loadedTypes[0] {
		if e.User == nil {
			// Edge was loaded but was not found.
			return nil, &NotFoundError{label: user.Label}
		}
		return e.User, nil
	}
	return nil, &NotLoadedError{edge: "user"}
}

// LikedByOrErr returns the LikedBy value or an error if the edge
// was not loaded in eager-loading.
func (e SongEdges) LikedByOrErr() ([]*Like, error) {
	if e.loadedTypes[1] {
		return e.LikedBy, nil
	}
	return nil, &NotLoadedError{edge: "liked_by"}
}

// PlaylistsOrErr returns the Playlists value or an error if the edge
// was not loaded in eager-loading.
func (e SongEdges) PlaylistsOrErr() ([]*PlaylistSong, error) {
	if e.loadedTypes[2] {
		return e.Playlists, nil
	}
	return nil, &NotLoadedError{edge: "playlists"}
}

// scanValues returns the types for scanning values from sql.Rows.
func (*Song) scanValues(columns []string) ([]any, error) {
	values := make([]any, len(columns))
	for i := range columns {
		switch columns[i] {
		case song.FieldPlays, song.FieldDuration:
			values[i] = new(sql.NullInt64)
		case song.FieldTitle, song.FieldURL:
			values[i] = new(sql.NullString)
		case song.FieldCreatedAt, song.FieldUpdatedAt:
			values[i] = new(sql.NullTime)
		case song.FieldID, song.FieldArtistID:
			values[i] = new(uuid.UUID)
		default:
			return nil, fmt.Errorf("unexpected column %q for type Song", columns[i])
		}
	}
	return values, nil
}

// assignValues assigns the values that were returned from sql.Rows (after scanning)
// to the Song fields.
func (s *Song) assignValues(columns []string, values []any) error {
	if m, n := len(values), len(columns); m < n {
		return fmt.Errorf("mismatch number of scan values: %d != %d", m, n)
	}
	for i := range columns {
		switch columns[i] {
		case song.FieldID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field id", values[i])
			} else if value != nil {
				s.ID = *value
			}
		case song.FieldCreatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field created_at", values[i])
			} else if value.Valid {
				s.CreatedAt = value.Time
			}
		case song.FieldUpdatedAt:
			if value, ok := values[i].(*sql.NullTime); !ok {
				return fmt.Errorf("unexpected type %T for field updated_at", values[i])
			} else if value.Valid {
				s.UpdatedAt = value.Time
			}
		case song.FieldArtistID:
			if value, ok := values[i].(*uuid.UUID); !ok {
				return fmt.Errorf("unexpected type %T for field artist_id", values[i])
			} else if value != nil {
				s.ArtistID = *value
			}
		case song.FieldTitle:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field title", values[i])
			} else if value.Valid {
				s.Title = value.String
			}
		case song.FieldURL:
			if value, ok := values[i].(*sql.NullString); !ok {
				return fmt.Errorf("unexpected type %T for field url", values[i])
			} else if value.Valid {
				s.URL = value.String
			}
		case song.FieldPlays:
			if value, ok := values[i].(*sql.NullInt64); !ok {
				return fmt.Errorf("unexpected type %T for field plays", values[i])
			} else if value.Valid {
				s.Plays = uint32(value.Int64)
			}
		case song.FieldDuration:
			if value, ok := values[i].(*sql.NullInt64); !ok {
				return fmt.Errorf("unexpected type %T for field duration", values[i])
			} else if value.Valid {
				s.Duration = uint32(value.Int64)
			}
		}
	}
	return nil
}

// QueryUser queries the "user" edge of the Song entity.
func (s *Song) QueryUser() *UserQuery {
	return (&SongClient{config: s.config}).QueryUser(s)
}

// QueryLikedBy queries the "liked_by" edge of the Song entity.
func (s *Song) QueryLikedBy() *LikeQuery {
	return (&SongClient{config: s.config}).QueryLikedBy(s)
}

// QueryPlaylists queries the "playlists" edge of the Song entity.
func (s *Song) QueryPlaylists() *PlaylistSongQuery {
	return (&SongClient{config: s.config}).QueryPlaylists(s)
}

// Update returns a builder for updating this Song.
// Note that you need to call Song.Unwrap() before calling this method if this Song
// was returned from a transaction, and the transaction was committed or rolled back.
func (s *Song) Update() *SongUpdateOne {
	return (&SongClient{config: s.config}).UpdateOne(s)
}

// Unwrap unwraps the Song entity that was returned from a transaction after it was closed,
// so that all future queries will be executed through the driver which created the transaction.
func (s *Song) Unwrap() *Song {
	_tx, ok := s.config.driver.(*txDriver)
	if !ok {
		panic("ent: Song is not a transactional entity")
	}
	s.config.driver = _tx.drv
	return s
}

// String implements the fmt.Stringer.
func (s *Song) String() string {
	var builder strings.Builder
	builder.WriteString("Song(")
	builder.WriteString(fmt.Sprintf("id=%v, ", s.ID))
	builder.WriteString("created_at=")
	builder.WriteString(s.CreatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("updated_at=")
	builder.WriteString(s.UpdatedAt.Format(time.ANSIC))
	builder.WriteString(", ")
	builder.WriteString("artist_id=")
	builder.WriteString(fmt.Sprintf("%v", s.ArtistID))
	builder.WriteString(", ")
	builder.WriteString("title=")
	builder.WriteString(s.Title)
	builder.WriteString(", ")
	builder.WriteString("url=")
	builder.WriteString(s.URL)
	builder.WriteString(", ")
	builder.WriteString("plays=")
	builder.WriteString(fmt.Sprintf("%v", s.Plays))
	builder.WriteString(", ")
	builder.WriteString("duration=")
	builder.WriteString(fmt.Sprintf("%v", s.Duration))
	builder.WriteByte(')')
	return builder.String()
}

// Songs is a parsable slice of Song.
type Songs []*Song

func (s Songs) config(cfg config) {
	for _i := range s {
		s[_i].config = cfg
	}
}
