import 'package:horizon/domain/core/failures.dart';

/// Error thrown if the user is not authenticated.
class NotAuthenticatedError extends Error {}

/// Error thrown if the type-safe value contains an invalid value.
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
