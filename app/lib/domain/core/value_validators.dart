import 'package:dartz/dartz.dart';
import 'package:horizon/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateUsername(String input) {
  if (input.trim().length >= 3 && input.trim().length <= 32) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUsername(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePlaylistName(String input) {
  if (input.length >= 3 || input.length <= 50) {
    return right(input);
  } else {
    return left(ValueFailure.invalidInput(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePlaylistDescription(String input) {
  if (input.length <= 150) {
    return right(input);
  } else {
    return left(ValueFailure.invalidInput(failedValue: input));
  }
}
