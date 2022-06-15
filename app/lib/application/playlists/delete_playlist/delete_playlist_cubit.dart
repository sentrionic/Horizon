import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:injectable/injectable.dart';

part 'delete_playlist_state.dart';
part 'delete_playlist_cubit.freezed.dart';

@injectable
class DeletePlaylistCubit extends Cubit<DeletePlaylistState> {
  final IPlaylistRepository _repository;

  DeletePlaylistCubit(this._repository)
      : super(const DeletePlaylistState.initial());

  Future<void> deletePlaylist(String playlistId) async {
    emit(const DeletePlaylistState.actionInProgress());
    final possibleFailure = await _repository.deletePlaylist(playlistId);
    emit(
      possibleFailure.fold(
        (f) => DeletePlaylistState.deleteFailure(f),
        (p) => DeletePlaylistState.deleteSuccess(p),
      ),
    );
  }
}
