// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateAccountState {
  Username get username => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Account>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateAccountStateCopyWith<UpdateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAccountStateCopyWith<$Res> {
  factory $UpdateAccountStateCopyWith(
          UpdateAccountState value, $Res Function(UpdateAccountState) then) =
      _$UpdateAccountStateCopyWithImpl<$Res, UpdateAccountState>;
  @useResult
  $Res call(
      {Username username,
      EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSaving,
      Option<Either<AuthFailure, Account>> saveFailureOrSuccessOption});
}

/// @nodoc
class _$UpdateAccountStateCopyWithImpl<$Res, $Val extends UpdateAccountState>
    implements $UpdateAccountStateCopyWith<$Res> {
  _$UpdateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Account>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateAccountStateCopyWith<$Res>
    implements $UpdateAccountStateCopyWith<$Res> {
  factory _$$_UpdateAccountStateCopyWith(_$_UpdateAccountState value,
          $Res Function(_$_UpdateAccountState) then) =
      __$$_UpdateAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Username username,
      EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSaving,
      Option<Either<AuthFailure, Account>> saveFailureOrSuccessOption});
}

/// @nodoc
class __$$_UpdateAccountStateCopyWithImpl<$Res>
    extends _$UpdateAccountStateCopyWithImpl<$Res, _$_UpdateAccountState>
    implements _$$_UpdateAccountStateCopyWith<$Res> {
  __$$_UpdateAccountStateCopyWithImpl(
      _$_UpdateAccountState _value, $Res Function(_$_UpdateAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? emailAddress = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_UpdateAccountState(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Account>>,
    ));
  }
}

/// @nodoc

class _$_UpdateAccountState implements _UpdateAccountState {
  const _$_UpdateAccountState(
      {required this.username,
      required this.emailAddress,
      required this.showErrorMessages,
      required this.isSaving,
      required this.saveFailureOrSuccessOption});

  @override
  final Username username;
  @override
  final EmailAddress emailAddress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final Option<Either<AuthFailure, Account>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'UpdateAccountState(username: $username, emailAddress: $emailAddress, showErrorMessages: $showErrorMessages, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAccountState &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, emailAddress,
      showErrorMessages, isSaving, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAccountStateCopyWith<_$_UpdateAccountState> get copyWith =>
      __$$_UpdateAccountStateCopyWithImpl<_$_UpdateAccountState>(
          this, _$identity);
}

abstract class _UpdateAccountState implements UpdateAccountState {
  const factory _UpdateAccountState(
      {required final Username username,
      required final EmailAddress emailAddress,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final Option<Either<AuthFailure, Account>>
          saveFailureOrSuccessOption}) = _$_UpdateAccountState;

  @override
  Username get username;
  @override
  EmailAddress get emailAddress;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  Option<Either<AuthFailure, Account>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateAccountStateCopyWith<_$_UpdateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
