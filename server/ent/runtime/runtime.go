// Code generated by ent, DO NOT EDIT.

package runtime

import (
	"time"

	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/like"
	"github.com/sentrionic/horizon/ent/playlist"
	"github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/ent/schema"
	"github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/ent/user"
)

// The init function reads all schema descriptors with runtime code
// (default values, validators, hooks and policies) and stitches it
// to their package variables.
func init() {
	likeFields := schema.Like{}.Fields()
	_ = likeFields
	// likeDescDateAdded is the schema descriptor for date_added field.
	likeDescDateAdded := likeFields[2].Descriptor()
	// like.DefaultDateAdded holds the default value on creation for the date_added field.
	like.DefaultDateAdded = likeDescDateAdded.Default.(func() time.Time)
	playlistMixin := schema.Playlist{}.Mixin()
	playlistMixinFields0 := playlistMixin[0].Fields()
	_ = playlistMixinFields0
	playlistFields := schema.Playlist{}.Fields()
	_ = playlistFields
	// playlistDescCreatedAt is the schema descriptor for created_at field.
	playlistDescCreatedAt := playlistMixinFields0[0].Descriptor()
	// playlist.DefaultCreatedAt holds the default value on creation for the created_at field.
	playlist.DefaultCreatedAt = playlistDescCreatedAt.Default.(func() time.Time)
	// playlistDescUpdatedAt is the schema descriptor for updated_at field.
	playlistDescUpdatedAt := playlistMixinFields0[1].Descriptor()
	// playlist.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	playlist.DefaultUpdatedAt = playlistDescUpdatedAt.Default.(func() time.Time)
	// playlist.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	playlist.UpdateDefaultUpdatedAt = playlistDescUpdatedAt.UpdateDefault.(func() time.Time)
	// playlistDescName is the schema descriptor for name field.
	playlistDescName := playlistFields[2].Descriptor()
	// playlist.NameValidator is a validator for the "name" field. It is called by the builders before save.
	playlist.NameValidator = func() func(string) error {
		validators := playlistDescName.Validators
		fns := [...]func(string) error{
			validators[0].(func(string) error),
			validators[1].(func(string) error),
			validators[2].(func(string) error),
		}
		return func(name string) error {
			for _, fn := range fns {
				if err := fn(name); err != nil {
					return err
				}
			}
			return nil
		}
	}()
	// playlistDescID is the schema descriptor for id field.
	playlistDescID := playlistFields[0].Descriptor()
	// playlist.DefaultID holds the default value on creation for the id field.
	playlist.DefaultID = playlistDescID.Default.(func() uuid.UUID)
	playlistsongFields := schema.PlaylistSong{}.Fields()
	_ = playlistsongFields
	// playlistsongDescDateAdded is the schema descriptor for date_added field.
	playlistsongDescDateAdded := playlistsongFields[2].Descriptor()
	// playlistsong.DefaultDateAdded holds the default value on creation for the date_added field.
	playlistsong.DefaultDateAdded = playlistsongDescDateAdded.Default.(func() time.Time)
	songMixin := schema.Song{}.Mixin()
	songMixinFields0 := songMixin[0].Fields()
	_ = songMixinFields0
	songFields := schema.Song{}.Fields()
	_ = songFields
	// songDescCreatedAt is the schema descriptor for created_at field.
	songDescCreatedAt := songMixinFields0[0].Descriptor()
	// song.DefaultCreatedAt holds the default value on creation for the created_at field.
	song.DefaultCreatedAt = songDescCreatedAt.Default.(func() time.Time)
	// songDescUpdatedAt is the schema descriptor for updated_at field.
	songDescUpdatedAt := songMixinFields0[1].Descriptor()
	// song.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	song.DefaultUpdatedAt = songDescUpdatedAt.Default.(func() time.Time)
	// song.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	song.UpdateDefaultUpdatedAt = songDescUpdatedAt.UpdateDefault.(func() time.Time)
	// songDescTitle is the schema descriptor for title field.
	songDescTitle := songFields[2].Descriptor()
	// song.TitleValidator is a validator for the "title" field. It is called by the builders before save.
	song.TitleValidator = func() func(string) error {
		validators := songDescTitle.Validators
		fns := [...]func(string) error{
			validators[0].(func(string) error),
			validators[1].(func(string) error),
			validators[2].(func(string) error),
		}
		return func(title string) error {
			for _, fn := range fns {
				if err := fn(title); err != nil {
					return err
				}
			}
			return nil
		}
	}()
	// songDescURL is the schema descriptor for url field.
	songDescURL := songFields[3].Descriptor()
	// song.URLValidator is a validator for the "url" field. It is called by the builders before save.
	song.URLValidator = songDescURL.Validators[0].(func(string) error)
	// songDescPlays is the schema descriptor for plays field.
	songDescPlays := songFields[4].Descriptor()
	// song.DefaultPlays holds the default value on creation for the plays field.
	song.DefaultPlays = songDescPlays.Default.(uint32)
	// songDescID is the schema descriptor for id field.
	songDescID := songFields[0].Descriptor()
	// song.DefaultID holds the default value on creation for the id field.
	song.DefaultID = songDescID.Default.(func() uuid.UUID)
	userMixin := schema.User{}.Mixin()
	userHooks := schema.User{}.Hooks()
	user.Hooks[0] = userHooks[0]
	userMixinFields0 := userMixin[0].Fields()
	_ = userMixinFields0
	userFields := schema.User{}.Fields()
	_ = userFields
	// userDescCreatedAt is the schema descriptor for created_at field.
	userDescCreatedAt := userMixinFields0[0].Descriptor()
	// user.DefaultCreatedAt holds the default value on creation for the created_at field.
	user.DefaultCreatedAt = userDescCreatedAt.Default.(func() time.Time)
	// userDescUpdatedAt is the schema descriptor for updated_at field.
	userDescUpdatedAt := userMixinFields0[1].Descriptor()
	// user.DefaultUpdatedAt holds the default value on creation for the updated_at field.
	user.DefaultUpdatedAt = userDescUpdatedAt.Default.(func() time.Time)
	// user.UpdateDefaultUpdatedAt holds the default value on update for the updated_at field.
	user.UpdateDefaultUpdatedAt = userDescUpdatedAt.UpdateDefault.(func() time.Time)
	// userDescUsername is the schema descriptor for username field.
	userDescUsername := userFields[1].Descriptor()
	// user.UsernameValidator is a validator for the "username" field. It is called by the builders before save.
	user.UsernameValidator = func() func(string) error {
		validators := userDescUsername.Validators
		fns := [...]func(string) error{
			validators[0].(func(string) error),
			validators[1].(func(string) error),
			validators[2].(func(string) error),
		}
		return func(username string) error {
			for _, fn := range fns {
				if err := fn(username); err != nil {
					return err
				}
			}
			return nil
		}
	}()
	// userDescEmail is the schema descriptor for email field.
	userDescEmail := userFields[2].Descriptor()
	// user.EmailValidator is a validator for the "email" field. It is called by the builders before save.
	user.EmailValidator = func() func(string) error {
		validators := userDescEmail.Validators
		fns := [...]func(string) error{
			validators[0].(func(string) error),
			validators[1].(func(string) error),
		}
		return func(email string) error {
			for _, fn := range fns {
				if err := fn(email); err != nil {
					return err
				}
			}
			return nil
		}
	}()
	// userDescPassword is the schema descriptor for password field.
	userDescPassword := userFields[3].Descriptor()
	// user.PasswordValidator is a validator for the "password" field. It is called by the builders before save.
	user.PasswordValidator = func() func(string) error {
		validators := userDescPassword.Validators
		fns := [...]func(string) error{
			validators[0].(func(string) error),
			validators[1].(func(string) error),
		}
		return func(password string) error {
			for _, fn := range fns {
				if err := fn(password); err != nil {
					return err
				}
			}
			return nil
		}
	}()
	// userDescImage is the schema descriptor for image field.
	userDescImage := userFields[4].Descriptor()
	// user.ImageValidator is a validator for the "image" field. It is called by the builders before save.
	user.ImageValidator = userDescImage.Validators[0].(func(string) error)
	// userDescID is the schema descriptor for id field.
	userDescID := userFields[0].Descriptor()
	// user.DefaultID holds the default value on creation for the id field.
	user.DefaultID = userDescID.Default.(func() uuid.UUID)
}

const (
	Version = "v0.11.3"                                         // Version of ent codegen.
	Sum     = "h1:F5FBGAWiDCGder7YT+lqMnyzXl6d0xU3xMBM/SO3CMc=" // Sum of ent codegen.
)
