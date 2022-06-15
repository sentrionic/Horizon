package utils

import (
	"context"
	"github.com/sethvargo/go-envconfig"
	"time"
)

type Config struct {
	DatabaseUrl          string        `env:"DATABASE_URL"`
	Port                 string        `env:"PORT"`
	TokenSymmetricKey    string        `env:"TOKEN_SYMMETRIC_KEY"`
	AccessTokenDuration  time.Duration `env:"ACCESS_TOKEN_DURATION"`
	RefreshTokenDuration time.Duration `env:"REFRESH_TOKEN_DURATION"`
	AdminEmail           string        `env:"ADMIN_EMAIL"`
	AdminUsername        string        `env:"ADMIN_USERNAME"`
	AdminPassword        string        `env:"ADMIN_PASSWORD"`
	AccessKey            string        `env:"ACCESS_KEY"`
	SecretKey            string        `env:"SECRET_KEY"`
	BucketName           string        `env:"BUCKET_NAME"`
	Region               string        `env:"REGION"`
}

func LoadConfig(ctx context.Context) (config Config, err error) {
	err = envconfig.Process(ctx, &config)

	if err != nil {
		return
	}

	return
}
