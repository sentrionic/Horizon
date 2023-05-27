// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_song_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddSongState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(PlaylistFailure failure) addFailure,
    required TResult Function(Song song) addSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(PlaylistFailure failure)? addFailure,
    TResult? Function(Song song)? addSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(PlaylistFailure failure)? addFailure,
    TResult Function(Song song)? addSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_AddFailure value) addFailure,
    required TResult Function(_AddSuccess value) addSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_AddFailure value)? addFailure,
    TResult? Function(_AddSuccess value)? addSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_AddFailure value)? addFailure,
    TResult Function(_AddSuccess value)? addSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSongStateCopyWith<$Res> {
  factory $AddSongStateCopyWith(
          AddSongState value, $Res Function(AddSongState) then) =
      _$AddSongStateCopyWithImpl<$Res, AddSongState>;
}

/// @nodoc
class _$AddSongStateCopyWithImpl<$Res, $Val extends AddSongState>
    implements $AddSongStateCopyWith<$Res> {
  _$AddSongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AddSongStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AddSongState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(PlaylistFailure failure) addFailure,
    required TResult Function(Song song) addSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(PlaylistFailure failure)? addFailure,
    TResult? Function(Song song)? addSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(PlaylistFailure failure)? addFailure,
    TResult Function(Song song)? addSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_AddFailure value) addFailure,
    required TResult Function(_AddSuccess value) addSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_AddFailure value)? addFailure,
    TResult? Function(_AddSuccess value)? addSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_AddFailure value)? addFailure,
    TResult Function(_AddSuccess value)? addSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddSongState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ActionInProgressCopyWith<$Res> {
  factory _$$_ActionInProgressCopyWith(
          _$_ActionInProgress value, $Res Function(_$_ActionInProgress) then) =
      __$$_ActionInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ActionInProgressCopyWithImpl<$Res>
    extends _$AddSongStateCopyWithImpl<$Res, _$_ActionInProgress>
    implements _$$_ActionInProgressCopyWith<$Res> {
  __$$_ActionInProgressCopyWithImpl(
      _$_ActionInProgress _value, $Res Function(_$_ActionInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ActionInProgress implements _ActionInProgress {
  const _$_ActionInProgress();

  @override
  String toString() {
    return 'AddSongState.actionInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ActionInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(PlaylistFailure failure) addFailure,
    required TResult Function(Song song) addSuccess,
  }) {
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(PlaylistFailure failure)? addFailure,
    TResult? Function(Song song)? addSuccess,
  }) {
    return actionInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(PlaylistFailure failure)? addFailure,
    TResult Function(Song song)? addSuccess,
    required TResult orElse(),
  }) {
    if (actionInProgress != null) {
      return actionInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_AddFailure value) addFailure,
    required TResult Function(_AddSuccess value) addSuccess,
  }) {
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_AddFailure value)? addFailure,
    TResult? Function(_AddSuccess value)? addSuccess,
  }) {
    return actionInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_AddFailure value)? addFailure,
    TResult Function(_AddSuccess value)? addSuccess,
    required TResult orElse(),
  }) {
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements AddSongState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$$_AddFailureCopyWith<$Res> {
  factory _$$_AddFailureCopyWith(
          _$_AddFailure value, $Res Function(_$_AddFailure) then) =
      __$$_AddFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PlaylistFailure failure});

  $PlaylistFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_AddFailureCopyWithImpl<$Res>
    extends _$AddSongStateCopyWithImpl<$Res, _$_AddFailure>
    implements _$$_AddFailureCopyWith<$Res> {
  __$$_AddFailureCopyWithImpl(
      _$_AddFailure _value, $Res Function(_$_AddFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_AddFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PlaylistFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaylistFailureCopyWith<$Res> get failure {
    return $PlaylistFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_AddFailure implements _AddFailure {
  const _$_AddFailure(this.failure);

  @override
  final PlaylistFailure failure;

  @override
  String toString() {
    return 'AddSongState.addFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFailureCopyWith<_$_AddFailure> get copyWith =>
      __$$_AddFailureCopyWithImpl<_$_AddFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(PlaylistFailure failure) addFailure,
    required TResult Function(Song song) addSuccess,
  }) {
    return addFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(PlaylistFailure failure)? addFailure,
    TResult? Function(Song song)? addSuccess,
  }) {
    return addFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(PlaylistFailure failure)? addFailure,
    TResult Function(Song song)? addSuccess,
    required TResult orElse(),
  }) {
    if (addFailure != null) {
      return addFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_AddFailure value) addFailure,
    required TResult Function(_AddSuccess value) addSuccess,
  }) {
    return addFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_AddFailure value)? addFailure,
    TResult? Function(_AddSuccess value)? addSuccess,
  }) {
    return addFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_AddFailure value)? addFailure,
    TResult Function(_AddSuccess value)? addSuccess,
    required TResult orElse(),
  }) {
    if (addFailure != null) {
      return addFailure(this);
    }
    return orElse();
  }
}

abstract class _AddFailure implements AddSongState {
  const factory _AddFailure(final PlaylistFailure failure) = _$_AddFailure;

  PlaylistFailure get failure;
  @JsonKey(ignore: true)
  _$$_AddFailureCopyWith<_$_AddFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddSuccessCopyWith<$Res> {
  factory _$$_AddSuccessCopyWith(
          _$_AddSuccess value, $Res Function(_$_AddSuccess) then) =
      __$$_AddSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Song song});

  $SongCopyWith<$Res> get song;
}

/// @nodoc
class __$$_AddSuccessCopyWithImpl<$Res>
    extends _$AddSongStateCopyWithImpl<$Res, _$_AddSuccess>
    implements _$$_AddSuccessCopyWith<$Res> {
  __$$_AddSuccessCopyWithImpl(
      _$_AddSuccess _value, $Res Function(_$_AddSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$_AddSuccess(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SongCopyWith<$Res> get song {
    return $SongCopyWith<$Res>(_value.song, (value) {
      return _then(_value.copyWith(song: value));
    });
  }
}

/// @nodoc

class _$_AddSuccess implements _AddSuccess {
  const _$_AddSuccess(this.song);

  @override
  final Song song;

  @override
  String toString() {
    return 'AddSongState.addSuccess(song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSuccess &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddSuccessCopyWith<_$_AddSuccess> get copyWith =>
      __$$_AddSuccessCopyWithImpl<_$_AddSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(PlaylistFailure failure) addFailure,
    required TResult Function(Song song) addSuccess,
  }) {
    return addSuccess(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(PlaylistFailure failure)? addFailure,
    TResult? Function(Song song)? addSuccess,
  }) {
    return addSuccess?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(PlaylistFailure failure)? addFailure,
    TResult Function(Song song)? addSuccess,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_AddFailure value) addFailure,
    required TResult Function(_AddSuccess value) addSuccess,
  }) {
    return addSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_AddFailure value)? addFailure,
    TResult? Function(_AddSuccess value)? addSuccess,
  }) {
    return addSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_AddFailure value)? addFailure,
    TResult Function(_AddSuccess value)? addSuccess,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddSuccess implements AddSongState {
  const factory _AddSuccess(final Song song) = _$_AddSuccess;

  Song get song;
  @JsonKey(ignore: true)
  _$$_AddSuccessCopyWith<_$_AddSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
