// Code generated by entc, DO NOT EDIT.

package migrate

import (
	"entgo.io/ent/dialect/sql/schema"
	"entgo.io/ent/schema/field"
)

var (
	// LikesColumns holds the columns for the "likes" table.
	LikesColumns = []*schema.Column{
		{Name: "id", Type: field.TypeInt, Increment: true},
		{Name: "date_added", Type: field.TypeTime},
		{Name: "song_id", Type: field.TypeUUID},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// LikesTable holds the schema information for the "likes" table.
	LikesTable = &schema.Table{
		Name:       "likes",
		Columns:    LikesColumns,
		PrimaryKey: []*schema.Column{LikesColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "likes_songs_liked_by",
				Columns:    []*schema.Column{LikesColumns[2]},
				RefColumns: []*schema.Column{SongsColumns[0]},
				OnDelete:   schema.Cascade,
			},
			{
				Symbol:     "likes_users_likes",
				Columns:    []*schema.Column{LikesColumns[3]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.Cascade,
			},
		},
	}
	// PlaylistsColumns holds the columns for the "playlists" table.
	PlaylistsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "name", Type: field.TypeString, Size: 30},
		{Name: "description", Type: field.TypeString, Nullable: true},
		{Name: "user_id", Type: field.TypeUUID},
	}
	// PlaylistsTable holds the schema information for the "playlists" table.
	PlaylistsTable = &schema.Table{
		Name:       "playlists",
		Columns:    PlaylistsColumns,
		PrimaryKey: []*schema.Column{PlaylistsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "playlists_users_playlists",
				Columns:    []*schema.Column{PlaylistsColumns[5]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.Cascade,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "playlist_name_user_id",
				Unique:  false,
				Columns: []*schema.Column{PlaylistsColumns[3], PlaylistsColumns[5]},
			},
		},
	}
	// PlaylistSongsColumns holds the columns for the "playlist_songs" table.
	PlaylistSongsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeInt, Increment: true},
		{Name: "date_added", Type: field.TypeTime},
		{Name: "playlist_id", Type: field.TypeUUID},
		{Name: "song_id", Type: field.TypeUUID},
	}
	// PlaylistSongsTable holds the schema information for the "playlist_songs" table.
	PlaylistSongsTable = &schema.Table{
		Name:       "playlist_songs",
		Columns:    PlaylistSongsColumns,
		PrimaryKey: []*schema.Column{PlaylistSongsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "playlist_songs_playlists_songs",
				Columns:    []*schema.Column{PlaylistSongsColumns[2]},
				RefColumns: []*schema.Column{PlaylistsColumns[0]},
				OnDelete:   schema.Cascade,
			},
			{
				Symbol:     "playlist_songs_songs_playlists",
				Columns:    []*schema.Column{PlaylistSongsColumns[3]},
				RefColumns: []*schema.Column{SongsColumns[0]},
				OnDelete:   schema.Cascade,
			},
		},
	}
	// SongsColumns holds the columns for the "songs" table.
	SongsColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "title", Type: field.TypeString, Size: 30},
		{Name: "url", Type: field.TypeString},
		{Name: "plays", Type: field.TypeUint32, Default: 0},
		{Name: "duration", Type: field.TypeUint32},
		{Name: "artist_id", Type: field.TypeUUID},
	}
	// SongsTable holds the schema information for the "songs" table.
	SongsTable = &schema.Table{
		Name:       "songs",
		Columns:    SongsColumns,
		PrimaryKey: []*schema.Column{SongsColumns[0]},
		ForeignKeys: []*schema.ForeignKey{
			{
				Symbol:     "songs_users_songs",
				Columns:    []*schema.Column{SongsColumns[7]},
				RefColumns: []*schema.Column{UsersColumns[0]},
				OnDelete:   schema.Cascade,
			},
		},
		Indexes: []*schema.Index{
			{
				Name:    "song_title_artist_id",
				Unique:  false,
				Columns: []*schema.Column{SongsColumns[3], SongsColumns[7]},
			},
		},
	}
	// UsersColumns holds the columns for the "users" table.
	UsersColumns = []*schema.Column{
		{Name: "id", Type: field.TypeUUID},
		{Name: "created_at", Type: field.TypeTime},
		{Name: "updated_at", Type: field.TypeTime},
		{Name: "username", Type: field.TypeString, Unique: true, Size: 30},
		{Name: "email", Type: field.TypeString, Unique: true},
		{Name: "password", Type: field.TypeString, Size: 2147483647},
		{Name: "image", Type: field.TypeString, Size: 2147483647},
		{Name: "role", Type: field.TypeEnum, Enums: []string{"admin", "user"}, Default: "user"},
	}
	// UsersTable holds the schema information for the "users" table.
	UsersTable = &schema.Table{
		Name:       "users",
		Columns:    UsersColumns,
		PrimaryKey: []*schema.Column{UsersColumns[0]},
		Indexes: []*schema.Index{
			{
				Name:    "user_username_email",
				Unique:  true,
				Columns: []*schema.Column{UsersColumns[3], UsersColumns[4]},
			},
		},
	}
	// Tables holds all the tables in the schema.
	Tables = []*schema.Table{
		LikesTable,
		PlaylistsTable,
		PlaylistSongsTable,
		SongsTable,
		UsersTable,
	}
)

func init() {
	LikesTable.ForeignKeys[0].RefTable = SongsTable
	LikesTable.ForeignKeys[1].RefTable = UsersTable
	PlaylistsTable.ForeignKeys[0].RefTable = UsersTable
	PlaylistSongsTable.ForeignKeys[0].RefTable = PlaylistsTable
	PlaylistSongsTable.ForeignKeys[1].RefTable = SongsTable
	SongsTable.ForeignKeys[0].RefTable = UsersTable
}
