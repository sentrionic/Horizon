part of 'toggle_like_cubit.dart';

@freezed
class ToggleLikeState with _$ToggleLikeState {
  const factory ToggleLikeState.initial() = _Initial;
  const factory ToggleLikeState.actionInProgress() = _ActionInProgress;
  const factory ToggleLikeState.toggleFailure(SongFailure failure) =
      _ToggleFailure;
  const factory ToggleLikeState.toggleSuccess(Song song) = _ToggleSuccess;
}
