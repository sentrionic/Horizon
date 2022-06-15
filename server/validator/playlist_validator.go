package validator

func ValidatePlaylistName(value string) error {
	return ValidateString(value, 3, 50)
}

func ValidatePlaylistDescription(value *string) error {
	if value == nil {
		return nil
	}

	str := *value

	return ValidateString(str, 1, 150)
}
