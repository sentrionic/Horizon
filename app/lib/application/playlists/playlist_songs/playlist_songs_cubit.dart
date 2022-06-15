import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:injectable/injectable.dart';

part 'playlist_songs_state.dart';
part 'playlist_songs_cubit.freezed.dart';

@injectable
class PlaylistSongsCubit extends Cubit<PlaylistSongsState> {
  final IPlaylistRepository _repository;

  PlaylistSongsCubit(this._repository)
      : super(const PlaylistSongsState.initial());

  Future<void> getSongs(String id) async {
    emit(const PlaylistSongsState.loadInProgress());
    final failureOrSongs = await _repository.getSongs(id);
    emit(
      failureOrSongs.fold(
        (f) => PlaylistSongsState.loadFailure(f),
        (songs) => PlaylistSongsState.loadSuccess(songs),
      ),
    );
  }

  void updateSong(Song song) {
    state.maybeWhen(
      loadSuccess: (songs) async {
        final data = songs
            .map(
              (s) => s.id == song.id
                  ? s.copyWith(
                      isLiked: song.isLiked,
                    )
                  : s,
            )
            .toList();
        emit(PlaylistSongsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  void removeSong(Song song) {
    state.maybeWhen(
      loadSuccess: (songs) async {
        final data = songs.where((s) => s.id != song.id).toList();
        emit(PlaylistSongsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
