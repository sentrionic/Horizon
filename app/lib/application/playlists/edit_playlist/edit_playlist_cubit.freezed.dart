// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_playlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditPlaylistState {
  PlaylistName get name => throw _privateConstructorUsedError;
  PlaylistDescription get description => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<PlaylistFailure, Playlist>> get editFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditPlaylistStateCopyWith<EditPlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPlaylistStateCopyWith<$Res> {
  factory $EditPlaylistStateCopyWith(
          EditPlaylistState value, $Res Function(EditPlaylistState) then) =
      _$EditPlaylistStateCopyWithImpl<$Res, EditPlaylistState>;
  @useResult
  $Res call(
      {PlaylistName name,
      PlaylistDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<PlaylistFailure, Playlist>> editFailureOrSuccessOption});
}

/// @nodoc
class _$EditPlaylistStateCopyWithImpl<$Res, $Val extends EditPlaylistState>
    implements $EditPlaylistStateCopyWith<$Res> {
  _$EditPlaylistStateCopyWithImpl(this._value, this._then);

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
    Object? editFailureOrSuccessOption = null,
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
      editFailureOrSuccessOption: null == editFailureOrSuccessOption
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PlaylistFailure, Playlist>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditPlaylistStateCopyWith<$Res>
    implements $EditPlaylistStateCopyWith<$Res> {
  factory _$$_EditPlaylistStateCopyWith(_$_EditPlaylistState value,
          $Res Function(_$_EditPlaylistState) then) =
      __$$_EditPlaylistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlaylistName name,
      PlaylistDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<PlaylistFailure, Playlist>> editFailureOrSuccessOption});
}

/// @nodoc
class __$$_EditPlaylistStateCopyWithImpl<$Res>
    extends _$EditPlaylistStateCopyWithImpl<$Res, _$_EditPlaylistState>
    implements _$$_EditPlaylistStateCopyWith<$Res> {
  __$$_EditPlaylistStateCopyWithImpl(
      _$_EditPlaylistState _value, $Res Function(_$_EditPlaylistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? editFailureOrSuccessOption = null,
  }) {
    return _then(_$_EditPlaylistState(
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
      editFailureOrSuccessOption: null == editFailureOrSuccessOption
          ? _value.editFailureOrSuccessOption
          : editFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<PlaylistFailure, Playlist>>,
    ));
  }
}

/// @nodoc

class _$_EditPlaylistState implements _EditPlaylistState {
  const _$_EditPlaylistState(
      {required this.name,
      required this.description,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.editFailureOrSuccessOption});

  @override
  final PlaylistName name;
  @override
  final PlaylistDescription description;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<PlaylistFailure, Playlist>> editFailureOrSuccessOption;

  @override
  String toString() {
    return 'EditPlaylistState(name: $name, description: $description, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, editFailureOrSuccessOption: $editFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPlaylistState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.editFailureOrSuccessOption,
                    editFailureOrSuccessOption) ||
                other.editFailureOrSuccessOption ==
                    editFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      showErrorMessages, isSubmitting, editFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPlaylistStateCopyWith<_$_EditPlaylistState> get copyWith =>
      __$$_EditPlaylistStateCopyWithImpl<_$_EditPlaylistState>(
          this, _$identity);
}

abstract class _EditPlaylistState implements EditPlaylistState {
  const factory _EditPlaylistState(
      {required final PlaylistName name,
      required final PlaylistDescription description,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<PlaylistFailure, Playlist>>
          editFailureOrSuccessOption}) = _$_EditPlaylistState;

  @override
  PlaylistName get name;
  @override
  PlaylistDescription get description;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<PlaylistFailure, Playlist>> get editFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_EditPlaylistStateCopyWith<_$_EditPlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
