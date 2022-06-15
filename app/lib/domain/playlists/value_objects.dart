import 'package:dartz/dartz.dart';
import 'package:horizon/domain/core/failures.dart';
import 'package:horizon/domain/core/value_objects.dart';
import 'package:horizon/domain/core/value_validators.dart';

/// Type-safe value to store and validate the user's email.
class PlaylistName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlaylistName(String input) {
    return PlaylistName._(
      validatePlaylistName(input),
    );
  }

  const PlaylistName._(this.value);
}

/// Type-safe value to store and validate the user's password.
class PlaylistDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PlaylistDescription(String input) {
    return PlaylistDescription._(
      validatePlaylistDescription(input),
    );
  }

  const PlaylistDescription._(this.value);
}
