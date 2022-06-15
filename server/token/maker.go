package token

import (
	"github.com/google/uuid"
	"github.com/sentrionic/horizon"
	"time"
)

// Maker is an interface for managing tokens
type Maker interface {
	// CreateToken creates a new token for a specific username and duration
	CreateToken(uid uuid.UUID, role horizon.Role, duration time.Duration) (string, error)
	// VerifyToken checks if the token is valid or not
	VerifyToken(token string) (*Payload, error)
}
