package validator

import (
	"fmt"
	"github.com/sentrionic/horizon/ent/song"
)

func ValidateTitle(value string) error {
	return ValidateString(value, 3, 50)
}

func ValidateOrder(order *string) error {
	if order == nil {
		return nil
	}

	if *order != song.FieldCreatedAt && *order != song.FieldPlays {
		return fmt.Errorf("must be a valid order by field")
	}

	return nil
}
