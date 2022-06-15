package token

import (
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"github.com/sentrionic/horizon/utils"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestPasetoMaker(t *testing.T) {
	maker, err := NewPasetoMaker(utils.RandStringRunes(32))
	require.NoError(t, err)

	uid, err := uuid.NewRandom()
	require.NoError(t, err)

	duration := time.Minute

	issuedAt := time.Now()
	expiredAt := issuedAt.Add(duration)

	token, err := maker.CreateToken(uid, horizon.UserRole, duration)
	require.NoError(t, err)
	require.NotEmpty(t, token)

	payload, err := maker.VerifyToken(token)
	require.NoError(t, err)
	require.NotEmpty(t, token)

	require.NotZero(t, payload.ID)
	require.Equal(t, uid.String(), payload.UserID)
	require.Equal(t, string(horizon.UserRole), payload.Role)
	require.WithinDuration(t, issuedAt, payload.IssuedAt, time.Second)
	require.WithinDuration(t, expiredAt, payload.ExpiredAt, time.Second)
}

func TestExpiredPasetoToken(t *testing.T) {
	maker, err := NewPasetoMaker(utils.RandStringRunes(32))
	require.NoError(t, err)

	uid, err := uuid.NewRandom()
	require.NoError(t, err)

	token, err := maker.CreateToken(uid, horizon.UserRole, -time.Minute)
	require.NoError(t, err)
	require.NotEmpty(t, token)

	payload, err := maker.VerifyToken(token)
	require.Error(t, err)
	require.EqualError(t, err, ErrExpiredToken.Error())
	require.Nil(t, payload)
}
