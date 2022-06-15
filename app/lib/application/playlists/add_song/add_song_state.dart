part of 'add_song_cubit.dart';

@freezed
class AddSongState with _$AddSongState {
  const factory AddSongState.initial() = _Initial;
  const factory AddSongState.actionInProgress() = _ActionInProgress;
  const factory AddSongState.addFailure(PlaylistFailure failure) = _AddFailure;
  const factory AddSongState.addSuccess(Song song) = _AddSuccess;
}
