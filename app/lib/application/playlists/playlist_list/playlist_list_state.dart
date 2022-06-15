part of 'playlist_list_cubit.dart';

@freezed
class PlaylistListState with _$PlaylistListState {
  const factory PlaylistListState.initial() = _Initial;
  const factory PlaylistListState.loadInProgress() = _LoadInProgress;
  const factory PlaylistListState.loadSuccess(List<Playlist> playlists) =
      _LoadSuccess;
  const factory PlaylistListState.loadFailure(PlaylistFailure failure) =
      _LoadFailure;
}
