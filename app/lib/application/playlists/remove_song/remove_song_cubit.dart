import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:injectable/injectable.dart';

part 'remove_song_state.dart';
part 'remove_song_cubit.freezed.dart';

@injectable
class RemoveSongCubit extends Cubit<RemoveSongState> {
  final IPlaylistRepository _repository;

  RemoveSongCubit(this._repository) : super(const RemoveSongState.initial());

  Future<void> removeSong(String playlistId, String songId) async {
    emit(const RemoveSongState.actionInProgress());
    final possibleFailure = await _repository.removeSong(playlistId, songId);
    emit(
      possibleFailure.fold(
        (f) => RemoveSongState.removeFailure(f),
        (s) => RemoveSongState.removeSuccess(s),
      ),
    );
  }
}
