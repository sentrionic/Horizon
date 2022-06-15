import 'package:dartz/dartz.dart';
import 'package:horizon/domain/core/failures.dart';
import 'package:horizon/domain/core/value_objects.dart';
import 'package:horizon/domain/core/value_validators.dart';

/// Type-safe value to store and validate the user's email.
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

/// Type-safe value to store and validate the user's password.
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

/// Type-safe value to store and validate the username's email.
class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);
}
