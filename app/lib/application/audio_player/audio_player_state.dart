part of 'audio_player_cubit.dart';

@freezed
class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    required AudioPlayer player,
    String? currentlyPlayingID,
    required double volume,
    required bool shuffleEnabled,
  }) = _AudioPlayerState;

  factory AudioPlayerState.initial() => AudioPlayerState(
        player: AudioPlayer(),
        volume: 1.0,
        shuffleEnabled: false,
      );
}
