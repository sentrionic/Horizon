import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.passwordsDontMatch({
    required T failedValue,
  }) = PasswordsDontMatch<T>;

  const factory ValueFailure.invalidUsername({
    required T failedValue,
  }) = InvalidUsername<T>;

  const factory ValueFailure.invalidInput({
    required T failedValue,
  }) = InvalidInput<T>;
}
