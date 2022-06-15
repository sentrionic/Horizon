package server

import (
	"context"
	"entgo.io/ent/dialect"
	"github.com/alexedwards/argon2id"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/ent/enttest"
	"github.com/sentrionic/horizon/utils"
	"github.com/stretchr/testify/require"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/status"
	"testing"
)

func setupTestDB(t *testing.T) *ent.Client {
	return enttest.Open(t, dialect.SQLite, "file:ent?mode=memory&cache=shared&_fk=1")
}

func insertUserIntoDB(t *testing.T, db *ent.Client, user ent.User) {
	_, err := db.User.Create().
		SetUsername(user.Username).
		SetEmail(user.Email).
		SetID(user.ID).
		SetPassword(utils.RandStringRunes(8)).
		Save(context.Background())
	require.NoError(t, err)
}

func insertPlaylistIntoDB(t *testing.T, db *ent.Client, playlist ent.Playlist) {
	_, err := db.Playlist.Create().
		SetName(playlist.Name).
		SetDescription(*playlist.Description).
		SetID(playlist.ID).
		SetUserID(playlist.UserID).
		Save(context.Background())
	require.NoError(t, err)
}

func insertSongIntoDB(t *testing.T, db *ent.Client, song ent.Song) {
	_, err := db.Song.Create().
		SetTitle(song.Title).
		SetUserID(song.ArtistID).
		SetID(song.ID).
		SetDuration(song.Duration).
		SetURL(song.URL).
		Save(context.Background())
	require.NoError(t, err)
}

func checkBadRequest(t *testing.T, st *status.Status, field string) {
	for _, detail := range st.Details() {
		switch dt := detail.(type) {
		case *errdetails.BadRequest:
			for _, violation := range dt.GetFieldViolations() {
				require.Equal(t, violation.GetField(), field)
			}
		}
	}
}

func randomUser(t *testing.T) (user ent.User, password string) {
	id, err := uuid.NewUUID()
	require.NoError(t, err)

	email := utils.Email()
	password = utils.RandStringRunes(8)
	hash, err := argon2id.CreateHash(password, argon2id.DefaultParams)
	require.NoError(t, err)

	user = ent.User{
		ID:       id,
		Username: utils.Username(),
		Email:    email,
		Password: hash,
		Image:    utils.GenerateAvatar(email),
		Role:     horizon.UserRole,
	}
	return
}

func randomPlaylist(t *testing.T, userId uuid.UUID) ent.Playlist {
	id, err := uuid.NewUUID()
	require.NoError(t, err)

	description := utils.RandStringRunes(100)

	return ent.Playlist{
		ID:          id,
		UserID:      userId,
		Name:        utils.Username(),
		Description: &description,
	}
}

func randomSong(t *testing.T, artistId uuid.UUID) ent.Song {
	id, err := uuid.NewUUID()
	require.NoError(t, err)

	return ent.Song{
		ID:       id,
		ArtistID: artistId,
		Title:    utils.RandStringRunes(12),
		URL:      utils.RandStringRunes(10),
		Plays:    0,
		Duration: uint32(utils.RandInt(60, 300)),
	}
}
