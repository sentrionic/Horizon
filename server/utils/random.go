package utils

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"math/rand"
	"strings"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

var alphabet = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")

// RandStringRunes returns a random latin string of the given length
func RandStringRunes(n int) string {
	b := make([]rune, n)
	for i := range b {
		b[i] = alphabet[rand.Intn(len(alphabet))]
	}

	return string(b)
}

func randStringLowerRunes(n int) string {
	b := make([]rune, n)
	for i := range b {
		b[i] = alphabet[rand.Intn(len(alphabet)/2)]
	}

	return string(b)
}

// RandInt returns a random int within the given range
func RandInt(min, max int) int {
	return rand.Intn(max-min+1) + min
}

// Username returns a random string that's 4 to 15 characters long
func Username() string {
	return RandStringRunes(RandInt(4, 15))
}

// Email returns a random email ending with @example.com
func Email() string {
	email := fmt.Sprintf("%s@example.com", randStringLowerRunes(RandInt(5, 10)))
	return strings.ToLower(email)
}

// GenerateAvatar returns an gravatar using the md5 hash of the email
func GenerateAvatar(email string) string {
	hash := md5.Sum([]byte(email))
	return fmt.Sprintf("https://gravatar.com/avatar/%s?d=identicon", hex.EncodeToString(hash[:]))
}
