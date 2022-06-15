part of 'increment_playcount_cubit.dart';

@freezed
class IncrementPlaycountState with _$IncrementPlaycountState {
  const factory IncrementPlaycountState.initial() = _Initial;
  const factory IncrementPlaycountState.actionInProgress() = _ActionInProgress;
  const factory IncrementPlaycountState.toggleFailure(SongFailure failure) =
      _ToggleFailure;
  const factory IncrementPlaycountState.toggleSuccess(Song song) =
      _ToggleSuccess;
}
