// Code generated by entc, DO NOT EDIT.

package playlist

import (
	"time"

	"github.com/google/uuid"
)

const (
	// Label holds the string label denoting the playlist type in the database.
	Label = "playlist"
	// FieldID holds the string denoting the id field in the database.
	FieldID = "id"
	// FieldCreatedAt holds the string denoting the created_at field in the database.
	FieldCreatedAt = "created_at"
	// FieldUpdatedAt holds the string denoting the updated_at field in the database.
	FieldUpdatedAt = "updated_at"
	// FieldUserID holds the string denoting the user_id field in the database.
	FieldUserID = "user_id"
	// FieldName holds the string denoting the name field in the database.
	FieldName = "name"
	// FieldDescription holds the string denoting the description field in the database.
	FieldDescription = "description"
	// EdgeUser holds the string denoting the user edge name in mutations.
	EdgeUser = "user"
	// EdgeSongs holds the string denoting the songs edge name in mutations.
	EdgeSongs = "songs"
	// Table holds the table name of the playlist in the database.
	Table = "playlists"
	// UserTable is the table that holds the user relation/edge.
	UserTable = "playlists"
	// UserInverseTable is the table name for the User entity.
	// It exists in this package in order to avoid circular dependency with the "user" package.
	UserInverseTable = "users"
	// UserColumn is the table column denoting the user relation/edge.
	UserColumn = "user_id"
	// SongsTable is the table that holds the songs relation/edge.
	SongsTable = "playlist_songs"
	// SongsInverseTable is the table name for the PlaylistSong entity.
	// It exists in this package in order to avoid circular dependency with the "playlistsong" package.
	SongsInverseTable = "playlist_songs"
	// SongsColumn is the table column denoting the songs relation/edge.
	SongsColumn = "playlist_id"
)

// Columns holds all SQL columns for playlist fields.
var Columns = []string{
	FieldID,
	FieldCreatedAt,
	FieldUpdatedAt,
	FieldUserID,
	FieldName,
	FieldDescription,
}

// ValidColumn reports if the column name is valid (part of the table columns).
func ValidColumn(column string) bool {
	for i := range Columns {
		if column == Columns[i] {
			return true
		}
	}
	return false
}

var (
	// DefaultCreatedAt holds the default value on creation for the "created_at" field.
	DefaultCreatedAt func() time.Time
	// DefaultUpdatedAt holds the default value on creation for the "updated_at" field.
	DefaultUpdatedAt func() time.Time
	// UpdateDefaultUpdatedAt holds the default value on update for the "updated_at" field.
	UpdateDefaultUpdatedAt func() time.Time
	// NameValidator is a validator for the "name" field. It is called by the builders before save.
	NameValidator func(string) error
	// DefaultID holds the default value on creation for the "id" field.
	DefaultID func() uuid.UUID
)
