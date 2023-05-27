// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlayerState {
  AudioPlayer get player => throw _privateConstructorUsedError;
  String? get currentlyPlayingID => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  bool get shuffleEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlayerStateCopyWith<AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlayerStateCopyWith<$Res> {
  factory $AudioPlayerStateCopyWith(
          AudioPlayerState value, $Res Function(AudioPlayerState) then) =
      _$AudioPlayerStateCopyWithImpl<$Res, AudioPlayerState>;
  @useResult
  $Res call(
      {AudioPlayer player,
      String? currentlyPlayingID,
      double volume,
      bool shuffleEnabled});
}

/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res, $Val extends AudioPlayerState>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? currentlyPlayingID = freezed,
    Object? volume = null,
    Object? shuffleEnabled = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
      currentlyPlayingID: freezed == currentlyPlayingID
          ? _value.currentlyPlayingID
          : currentlyPlayingID // ignore: cast_nullable_to_non_nullable
              as String?,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      shuffleEnabled: null == shuffleEnabled
          ? _value.shuffleEnabled
          : shuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioPlayerStateCopyWith<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  factory _$$_AudioPlayerStateCopyWith(
          _$_AudioPlayerState value, $Res Function(_$_AudioPlayerState) then) =
      __$$_AudioPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AudioPlayer player,
      String? currentlyPlayingID,
      double volume,
      bool shuffleEnabled});
}

/// @nodoc
class __$$_AudioPlayerStateCopyWithImpl<$Res>
    extends _$AudioPlayerStateCopyWithImpl<$Res, _$_AudioPlayerState>
    implements _$$_AudioPlayerStateCopyWith<$Res> {
  __$$_AudioPlayerStateCopyWithImpl(
      _$_AudioPlayerState _value, $Res Function(_$_AudioPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? currentlyPlayingID = freezed,
    Object? volume = null,
    Object? shuffleEnabled = null,
  }) {
    return _then(_$_AudioPlayerState(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
      currentlyPlayingID: freezed == currentlyPlayingID
          ? _value.currentlyPlayingID
          : currentlyPlayingID // ignore: cast_nullable_to_non_nullable
              as String?,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      shuffleEnabled: null == shuffleEnabled
          ? _value.shuffleEnabled
          : shuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AudioPlayerState implements _AudioPlayerState {
  const _$_AudioPlayerState(
      {required this.player,
      this.currentlyPlayingID,
      required this.volume,
      required this.shuffleEnabled});

  @override
  final AudioPlayer player;
  @override
  final String? currentlyPlayingID;
  @override
  final double volume;
  @override
  final bool shuffleEnabled;

  @override
  String toString() {
    return 'AudioPlayerState(player: $player, currentlyPlayingID: $currentlyPlayingID, volume: $volume, shuffleEnabled: $shuffleEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlayerState &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.currentlyPlayingID, currentlyPlayingID) ||
                other.currentlyPlayingID == currentlyPlayingID) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.shuffleEnabled, shuffleEnabled) ||
                other.shuffleEnabled == shuffleEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, player, currentlyPlayingID, volume, shuffleEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      __$$_AudioPlayerStateCopyWithImpl<_$_AudioPlayerState>(this, _$identity);
}

abstract class _AudioPlayerState implements AudioPlayerState {
  const factory _AudioPlayerState(
      {required final AudioPlayer player,
      final String? currentlyPlayingID,
      required final double volume,
      required final bool shuffleEnabled}) = _$_AudioPlayerState;

  @override
  AudioPlayer get player;
  @override
  String? get currentlyPlayingID;
  @override
  double get volume;
  @override
  bool get shuffleEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPlayerStateCopyWith<_$_AudioPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
