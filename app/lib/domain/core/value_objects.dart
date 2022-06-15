import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/core/errors.dart';
import 'package:horizon/domain/core/failures.dart';

/// Abstract class that represents a type-safe value.
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // During development throw an error for easier debugging.
    if (!const bool.fromEnvironment('dart.vm.product')) {
      // id = identity - same as writing (right) => right
      return value.fold((f) => throw UnexpectedValueError(f), id);
    }
    // Return the value either way to not confuse the user.
    return getValue();
  }

  /// Returns the value either way.
  T getValue() {
    return value.fold((l) => l.failedValue, id);
  }

  /// Returns the failure if it exists or [unit].
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  /// Returns `true` if no error exists.
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
