// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidEmail<T>>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({required final T failedValue}) =
      _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$ShortPasswordCopyWith(
          _$ShortPassword<T> value, $Res Function(_$ShortPassword<T>) then) =
      __$$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$ShortPassword<T>>
    implements _$$ShortPasswordCopyWith<T, $Res> {
  __$$ShortPasswordCopyWithImpl(
      _$ShortPassword<T> _value, $Res Function(_$ShortPassword<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$ShortPassword<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      __$$ShortPasswordCopyWithImpl<T, _$ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({required final T failedValue}) =
      _$ShortPassword<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordsDontMatchCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$PasswordsDontMatchCopyWith(_$PasswordsDontMatch<T> value,
          $Res Function(_$PasswordsDontMatch<T>) then) =
      __$$PasswordsDontMatchCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$PasswordsDontMatchCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$PasswordsDontMatch<T>>
    implements _$$PasswordsDontMatchCopyWith<T, $Res> {
  __$$PasswordsDontMatchCopyWithImpl(_$PasswordsDontMatch<T> _value,
      $Res Function(_$PasswordsDontMatch<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$PasswordsDontMatch<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$PasswordsDontMatch<T> implements PasswordsDontMatch<T> {
  const _$PasswordsDontMatch({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.passwordsDontMatch(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordsDontMatch<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordsDontMatchCopyWith<T, _$PasswordsDontMatch<T>> get copyWith =>
      __$$PasswordsDontMatchCopyWithImpl<T, _$PasswordsDontMatch<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) {
    return passwordsDontMatch(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) {
    return passwordsDontMatch?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) {
    if (passwordsDontMatch != null) {
      return passwordsDontMatch(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) {
    return passwordsDontMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) {
    return passwordsDontMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) {
    if (passwordsDontMatch != null) {
      return passwordsDontMatch(this);
    }
    return orElse();
  }
}

abstract class PasswordsDontMatch<T> implements ValueFailure<T> {
  const factory PasswordsDontMatch({required final T failedValue}) =
      _$PasswordsDontMatch<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$PasswordsDontMatchCopyWith<T, _$PasswordsDontMatch<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidUsernameCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidUsernameCopyWith(_$InvalidUsername<T> value,
          $Res Function(_$InvalidUsername<T>) then) =
      __$$InvalidUsernameCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidUsernameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidUsername<T>>
    implements _$$InvalidUsernameCopyWith<T, $Res> {
  __$$InvalidUsernameCopyWithImpl(
      _$InvalidUsername<T> _value, $Res Function(_$InvalidUsername<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidUsername<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidUsername<T> implements InvalidUsername<T> {
  const _$InvalidUsername({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUsername(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidUsername<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidUsernameCopyWith<T, _$InvalidUsername<T>> get copyWith =>
      __$$InvalidUsernameCopyWithImpl<T, _$InvalidUsername<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) {
    return invalidUsername(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) {
    return invalidUsername?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidUsername != null) {
      return invalidUsername(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) {
    return invalidUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) {
    return invalidUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidUsername != null) {
      return invalidUsername(this);
    }
    return orElse();
  }
}

abstract class InvalidUsername<T> implements ValueFailure<T> {
  const factory InvalidUsername({required final T failedValue}) =
      _$InvalidUsername<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidUsernameCopyWith<T, _$InvalidUsername<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidInputCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidInputCopyWith(
          _$InvalidInput<T> value, $Res Function(_$InvalidInput<T>) then) =
      __$$InvalidInputCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidInputCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidInput<T>>
    implements _$$InvalidInputCopyWith<T, $Res> {
  __$$InvalidInputCopyWithImpl(
      _$InvalidInput<T> _value, $Res Function(_$InvalidInput<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidInput<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidInput<T> implements InvalidInput<T> {
  const _$InvalidInput({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidInput(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidInput<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidInputCopyWith<T, _$InvalidInput<T>> get copyWith =>
      __$$InvalidInputCopyWithImpl<T, _$InvalidInput<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) shortPassword,
    required TResult Function(T failedValue) passwordsDontMatch,
    required TResult Function(T failedValue) invalidUsername,
    required TResult Function(T failedValue) invalidInput,
  }) {
    return invalidInput(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? shortPassword,
    TResult? Function(T failedValue)? passwordsDontMatch,
    TResult? Function(T failedValue)? invalidUsername,
    TResult? Function(T failedValue)? invalidInput,
  }) {
    return invalidInput?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? shortPassword,
    TResult Function(T failedValue)? passwordsDontMatch,
    TResult Function(T failedValue)? invalidUsername,
    TResult Function(T failedValue)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(PasswordsDontMatch<T> value) passwordsDontMatch,
    required TResult Function(InvalidUsername<T> value) invalidUsername,
    required TResult Function(InvalidInput<T> value) invalidInput,
  }) {
    return invalidInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult? Function(InvalidUsername<T> value)? invalidUsername,
    TResult? Function(InvalidInput<T> value)? invalidInput,
  }) {
    return invalidInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(PasswordsDontMatch<T> value)? passwordsDontMatch,
    TResult Function(InvalidUsername<T> value)? invalidUsername,
    TResult Function(InvalidInput<T> value)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(this);
    }
    return orElse();
  }
}

abstract class InvalidInput<T> implements ValueFailure<T> {
  const factory InvalidInput({required final T failedValue}) =
      _$InvalidInput<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidInputCopyWith<T, _$InvalidInput<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
