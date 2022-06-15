part of 'liked_songs_cubit.dart';

@freezed
class LikedSongsState with _$LikedSongsState {
  const factory LikedSongsState.initial() = _Initial;
  const factory LikedSongsState.loadInProgress() = _LoadInProgress;

  const factory LikedSongsState.loadSuccess(List<Song> songs) = _LoadSuccess;
  const factory LikedSongsState.loadFailure(SongFailure failure) = _LoadFailure;
}
