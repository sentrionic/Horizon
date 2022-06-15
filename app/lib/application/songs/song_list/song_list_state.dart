part of 'song_list_cubit.dart';

@freezed
class SongListState with _$SongListState {
  const factory SongListState.initial() = _Initial;
  const factory SongListState.loadInProgress() = _LoadInProgress;

  const factory SongListState.loadSuccess(List<Song> songs) = _LoadSuccess;
  const factory SongListState.loadFailure(SongFailure failure) = _LoadFailure;
}
