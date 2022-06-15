part of 'home_songs_cubit.dart';

@freezed
class HomeSongsState with _$HomeSongsState {
  const factory HomeSongsState.initial() = _Initial;
  const factory HomeSongsState.loadInProgress() = _LoadInProgress;

  const factory HomeSongsState.loadSuccess(List<Song> songs) = _LoadSuccess;
  const factory HomeSongsState.loadFailure(SongFailure failure) = _LoadFailure;
}
