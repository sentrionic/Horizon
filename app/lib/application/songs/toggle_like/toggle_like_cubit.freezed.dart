// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_like_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToggleLikeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(SongFailure failure) toggleFailure,
    required TResult Function(Song song) toggleSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(SongFailure failure)? toggleFailure,
    TResult? Function(Song song)? toggleSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(SongFailure failure)? toggleFailure,
    TResult Function(Song song)? toggleSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_ToggleFailure value) toggleFailure,
    required TResult Function(_ToggleSuccess value) toggleSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ToggleFailure value)? toggleFailure,
    TResult? Function(_ToggleSuccess value)? toggleSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ToggleFailure value)? toggleFailure,
    TResult Function(_ToggleSuccess value)? toggleSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleLikeStateCopyWith<$Res> {
  factory $ToggleLikeStateCopyWith(
          ToggleLikeState value, $Res Function(ToggleLikeState) then) =
      _$ToggleLikeStateCopyWithImpl<$Res, ToggleLikeState>;
}

/// @nodoc
class _$ToggleLikeStateCopyWithImpl<$Res, $Val extends ToggleLikeState>
    implements $ToggleLikeStateCopyWith<$Res> {
  _$ToggleLikeStateCopyWithImpl(this._value, this._then);

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
    extends _$ToggleLikeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ToggleLikeState.initial()';
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
    required TResult Function(SongFailure failure) toggleFailure,
    required TResult Function(Song song) toggleSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(SongFailure failure)? toggleFailure,
    TResult? Function(Song song)? toggleSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(SongFailure failure)? toggleFailure,
    TResult Function(Song song)? toggleSuccess,
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
    required TResult Function(_ToggleFailure value) toggleFailure,
    required TResult Function(_ToggleSuccess value) toggleSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ToggleFailure value)? toggleFailure,
    TResult? Function(_ToggleSuccess value)? toggleSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ToggleFailure value)? toggleFailure,
    TResult Function(_ToggleSuccess value)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ToggleLikeState {
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
    extends _$ToggleLikeStateCopyWithImpl<$Res, _$_ActionInProgress>
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
    return 'ToggleLikeState.actionInProgress()';
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
    required TResult Function(SongFailure failure) toggleFailure,
    required TResult Function(Song song) toggleSuccess,
  }) {
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(SongFailure failure)? toggleFailure,
    TResult? Function(Song song)? toggleSuccess,
  }) {
    return actionInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(SongFailure failure)? toggleFailure,
    TResult Function(Song song)? toggleSuccess,
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
    required TResult Function(_ToggleFailure value) toggleFailure,
    required TResult Function(_ToggleSuccess value) toggleSuccess,
  }) {
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ToggleFailure value)? toggleFailure,
    TResult? Function(_ToggleSuccess value)? toggleSuccess,
  }) {
    return actionInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ToggleFailure value)? toggleFailure,
    TResult Function(_ToggleSuccess value)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements ToggleLikeState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$$_ToggleFailureCopyWith<$Res> {
  factory _$$_ToggleFailureCopyWith(
          _$_ToggleFailure value, $Res Function(_$_ToggleFailure) then) =
      __$$_ToggleFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({SongFailure failure});

  $SongFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ToggleFailureCopyWithImpl<$Res>
    extends _$ToggleLikeStateCopyWithImpl<$Res, _$_ToggleFailure>
    implements _$$_ToggleFailureCopyWith<$Res> {
  __$$_ToggleFailureCopyWithImpl(
      _$_ToggleFailure _value, $Res Function(_$_ToggleFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_ToggleFailure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SongFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SongFailureCopyWith<$Res> get failure {
    return $SongFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_ToggleFailure implements _ToggleFailure {
  const _$_ToggleFailure(this.failure);

  @override
  final SongFailure failure;

  @override
  String toString() {
    return 'ToggleLikeState.toggleFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleFailure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleFailureCopyWith<_$_ToggleFailure> get copyWith =>
      __$$_ToggleFailureCopyWithImpl<_$_ToggleFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(SongFailure failure) toggleFailure,
    required TResult Function(Song song) toggleSuccess,
  }) {
    return toggleFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(SongFailure failure)? toggleFailure,
    TResult? Function(Song song)? toggleSuccess,
  }) {
    return toggleFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(SongFailure failure)? toggleFailure,
    TResult Function(Song song)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (toggleFailure != null) {
      return toggleFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_ToggleFailure value) toggleFailure,
    required TResult Function(_ToggleSuccess value) toggleSuccess,
  }) {
    return toggleFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ToggleFailure value)? toggleFailure,
    TResult? Function(_ToggleSuccess value)? toggleSuccess,
  }) {
    return toggleFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ToggleFailure value)? toggleFailure,
    TResult Function(_ToggleSuccess value)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (toggleFailure != null) {
      return toggleFailure(this);
    }
    return orElse();
  }
}

abstract class _ToggleFailure implements ToggleLikeState {
  const factory _ToggleFailure(final SongFailure failure) = _$_ToggleFailure;

  SongFailure get failure;
  @JsonKey(ignore: true)
  _$$_ToggleFailureCopyWith<_$_ToggleFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleSuccessCopyWith<$Res> {
  factory _$$_ToggleSuccessCopyWith(
          _$_ToggleSuccess value, $Res Function(_$_ToggleSuccess) then) =
      __$$_ToggleSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Song song});

  $SongCopyWith<$Res> get song;
}

/// @nodoc
class __$$_ToggleSuccessCopyWithImpl<$Res>
    extends _$ToggleLikeStateCopyWithImpl<$Res, _$_ToggleSuccess>
    implements _$$_ToggleSuccessCopyWith<$Res> {
  __$$_ToggleSuccessCopyWithImpl(
      _$_ToggleSuccess _value, $Res Function(_$_ToggleSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$_ToggleSuccess(
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

class _$_ToggleSuccess implements _ToggleSuccess {
  const _$_ToggleSuccess(this.song);

  @override
  final Song song;

  @override
  String toString() {
    return 'ToggleLikeState.toggleSuccess(song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleSuccess &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleSuccessCopyWith<_$_ToggleSuccess> get copyWith =>
      __$$_ToggleSuccessCopyWithImpl<_$_ToggleSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionInProgress,
    required TResult Function(SongFailure failure) toggleFailure,
    required TResult Function(Song song) toggleSuccess,
  }) {
    return toggleSuccess(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? actionInProgress,
    TResult? Function(SongFailure failure)? toggleFailure,
    TResult? Function(Song song)? toggleSuccess,
  }) {
    return toggleSuccess?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionInProgress,
    TResult Function(SongFailure failure)? toggleFailure,
    TResult Function(Song song)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (toggleSuccess != null) {
      return toggleSuccess(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionInProgress value) actionInProgress,
    required TResult Function(_ToggleFailure value) toggleFailure,
    required TResult Function(_ToggleSuccess value) toggleSuccess,
  }) {
    return toggleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ActionInProgress value)? actionInProgress,
    TResult? Function(_ToggleFailure value)? toggleFailure,
    TResult? Function(_ToggleSuccess value)? toggleSuccess,
  }) {
    return toggleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionInProgress value)? actionInProgress,
    TResult Function(_ToggleFailure value)? toggleFailure,
    TResult Function(_ToggleSuccess value)? toggleSuccess,
    required TResult orElse(),
  }) {
    if (toggleSuccess != null) {
      return toggleSuccess(this);
    }
    return orElse();
  }
}

abstract class _ToggleSuccess implements ToggleLikeState {
  const factory _ToggleSuccess(final Song song) = _$_ToggleSuccess;

  Song get song;
  @JsonKey(ignore: true)
  _$$_ToggleSuccessCopyWith<_$_ToggleSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
