// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_playlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePlaylistState {
  PlaylistName get name => throw _privateConstructorUsedError;
  PlaylistDescription get description => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<PlaylistFailure, Playlist>> get createFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePlaylistStateCopyWith<CreatePlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePlaylistStateCopyWith<$Res> {
  factory $CreatePlaylistStateCopyWith(
          CreatePlaylistState value, $Res Function(CreatePlaylistState) then) =
      _$CreatePlaylistStateCopyWithImpl<$Res, CreatePlaylistState>;
  @useResult
  $Res call(
      {PlaylistName name,
      PlaylistDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<PlaylistFailure, Playlist>> createFailureOrSuccessOption});
}

/// @nodoc
class _$CreatePlaylistStateCopyWithImpl<$Res, $Val extends CreatePlaylistState>
    implements $CreatePlaylistStateCopyWith<$Res> {
  _$CreatePlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? createFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlaylistName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as PlaylistDescription,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      createFailureOrSuccessOption: null == createFailureOrSuccessOption
          ? _value.createFailureOrSuccessOption
          : createFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PlaylistFailure, Playlist>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatePlaylistStateCopyWith<$Res>
    implements $CreatePlaylistStateCopyWith<$Res> {
  factory _$$_CreatePlaylistStateCopyWith(_$_CreatePlaylistState value,
          $Res Function(_$_CreatePlaylistState) then) =
      __$$_CreatePlaylistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlaylistName name,
      PlaylistDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<PlaylistFailure, Playlist>> createFailureOrSuccessOption});
}

/// @nodoc
class __$$_CreatePlaylistStateCopyWithImpl<$Res>
    extends _$CreatePlaylistStateCopyWithImpl<$Res, _$_CreatePlaylistState>
    implements _$$_CreatePlaylistStateCopyWith<$Res> {
  __$$_CreatePlaylistStateCopyWithImpl(_$_CreatePlaylistState _value,
      $Res Function(_$_CreatePlaylistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? createFailureOrSuccessOption = null,
  }) {
    return _then(_$_CreatePlaylistState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PlaylistName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as PlaylistDescription,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      createFailureOrSuccessOption: null == createFailureOrSuccessOption
          ? _value.createFailureOrSuccessOption
          : createFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PlaylistFailure, Playlist>>,
    ));
  }
}

/// @nodoc

class _$_CreatePlaylistState implements _CreatePlaylistState {
  const _$_CreatePlaylistState(
      {required this.name,
      required this.description,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.createFailureOrSuccessOption});

  @override
  final PlaylistName name;
  @override
  final PlaylistDescription description;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<PlaylistFailure, Playlist>> createFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreatePlaylistState(name: $name, description: $description, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, createFailureOrSuccessOption: $createFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePlaylistState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.createFailureOrSuccessOption,
                    createFailureOrSuccessOption) ||
                other.createFailureOrSuccessOption ==
                    createFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      showErrorMessages, isSubmitting, createFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePlaylistStateCopyWith<_$_CreatePlaylistState> get copyWith =>
      __$$_CreatePlaylistStateCopyWithImpl<_$_CreatePlaylistState>(
          this, _$identity);
}

abstract class _CreatePlaylistState implements CreatePlaylistState {
  const factory _CreatePlaylistState(
      {required final PlaylistName name,
      required final PlaylistDescription description,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<PlaylistFailure, Playlist>>
          createFailureOrSuccessOption}) = _$_CreatePlaylistState;

  @override
  PlaylistName get name;
  @override
  PlaylistDescription get description;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<PlaylistFailure, Playlist>> get createFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePlaylistStateCopyWith<_$_CreatePlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
