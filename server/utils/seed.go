package utils

import (
	"context"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
)

func SeedDatabase(ctx context.Context, config Config, client *ent.Client) error {
	return seedAdmin(ctx, config, client)
}

func seedAdmin(ctx context.Context, config Config, client *ent.Client) error {
	_, err := client.User.
		Query().
		Where(gen.EmailEQ(config.AdminEmail)).First(ctx)

	if err != nil {
		if ent.IsNotFound(err) {
			_, err = client.User.
				Create().
				SetUsername(config.AdminUsername).
				SetEmail(config.AdminEmail).
				SetPassword(config.AdminPassword).
				SetRole(horizon.AdminRole).
				Save(ctx)
			return err
		}
		return err
	}

	return nil
}
