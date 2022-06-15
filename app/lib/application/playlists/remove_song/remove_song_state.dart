part of 'remove_song_cubit.dart';

@freezed
class RemoveSongState with _$RemoveSongState {
  const factory RemoveSongState.initial() = _Initial;
  const factory RemoveSongState.actionInProgress() = _ActionInProgress;
  const factory RemoveSongState.removeFailure(PlaylistFailure failure) =
      _RemoveFailure;
  const factory RemoveSongState.removeSuccess(Song song) = _RemoveSuccess;
}
