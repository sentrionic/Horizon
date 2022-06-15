part of 'delete_playlist_cubit.dart';

@freezed
class DeletePlaylistState with _$DeletePlaylistState {
  const factory DeletePlaylistState.initial() = _Initial;
  const factory DeletePlaylistState.actionInProgress() = _ActionInProgress;
  const factory DeletePlaylistState.deleteFailure(PlaylistFailure failure) =
      _DeleteFailure;
  const factory DeletePlaylistState.deleteSuccess(Playlist playlist) =
      _DeleteSuccess;
}
