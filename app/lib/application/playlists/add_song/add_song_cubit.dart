import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:injectable/injectable.dart';

part 'add_song_state.dart';
part 'add_song_cubit.freezed.dart';

@injectable
class AddSongCubit extends Cubit<AddSongState> {
  final IPlaylistRepository _repository;

  AddSongCubit(this._repository) : super(const AddSongState.initial());

  Future<void> addSong(String playlistId, String songId) async {
    emit(const AddSongState.actionInProgress());
    final possibleFailure = await _repository.addSong(playlistId, songId);
    emit(
      possibleFailure.fold(
        (f) => AddSongState.addFailure(f),
        (s) => AddSongState.addSuccess(s),
      ),
    );
  }
}
