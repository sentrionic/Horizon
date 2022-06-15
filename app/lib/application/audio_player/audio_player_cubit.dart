import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_player_cubit.freezed.dart';
part 'audio_player_state.dart';

@injectable
class AudioPlayerCubit extends HydratedCubit<AudioPlayerState> {
  AudioPlayerCubit() : super(AudioPlayerState.initial());

  Future<void> setAudioSources(List<Song> songs) async {
    final songList =
        songs.map((e) => AudioSource.uri(Uri.parse(e.url), tag: e)).toList();
    await state.player
        .setAudioSource(ConcatenatingAudioSource(children: songList));
  }

  Future<void> setAudioAndPlay(
    List<Song> songs,
    int index,
    String? id, {
    bool reset = true,
  }) async {
    if (state.currentlyPlayingID != id) {
      await state.player.stop();
      await setAudioSources(songs);
      emit(
        state.copyWith(
          currentlyPlayingID: id,
        ),
      );
    }
    if (reset) {
      await state.player.seek(Duration.zero, index: index);
    }
    state.player.play();
  }

  Future<void> playLikedSongs(
    List<Song> songs,
    int index, {
    bool reset = true,
  }) async {
    if (reset) {
      await state.player.stop();
      await setAudioSources(songs);
      emit(
        state.copyWith(
          currentlyPlayingID: null,
        ),
      );
      await state.player.seek(Duration.zero, index: index);
    }
    state.player.play();
  }

  void setVolume(double volume) {
    state.player.setVolume(volume);
    emit(
      state.copyWith(
        volume: volume,
      ),
    );
  }

  @override
  Future<void> close() async {
    super.close();
    state.player.dispose();
  }

  @override
  AudioPlayerState? fromJson(Map<String, dynamic> json) {
    final volume = json['volume'] as double;
    final shuffleEnabled = json['shuffleEnabled'] as bool;
    final player = AudioPlayer()
      ..setVolume(volume)
      ..setShuffleModeEnabled(shuffleEnabled);

    return AudioPlayerState(
      player: player,
      volume: volume,
      shuffleEnabled: shuffleEnabled,
    );
  }

  @override
  Map<String, dynamic>? toJson(AudioPlayerState state) {
    return {
      'volume': state.volume,
      'shuffleEnabled': state.shuffleEnabled,
    };
  }
}
