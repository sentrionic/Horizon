part of 'playlist_songs_cubit.dart';

@freezed
class PlaylistSongsState with _$PlaylistSongsState {
  const factory PlaylistSongsState.initial() = _Initial;
  const factory PlaylistSongsState.loadInProgress() = _LoadInProgress;

  const factory PlaylistSongsState.loadSuccess(List<Song> songs) = _LoadSuccess;
  const factory PlaylistSongsState.loadFailure(PlaylistFailure failure) =
      _LoadFailure;
}
