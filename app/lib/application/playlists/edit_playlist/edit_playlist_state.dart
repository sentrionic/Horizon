part of 'edit_playlist_cubit.dart';

@freezed
class EditPlaylistState with _$EditPlaylistState {
  const factory EditPlaylistState({
    required PlaylistName name,
    required PlaylistDescription description,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<PlaylistFailure, Playlist>>
        editFailureOrSuccessOption,
  }) = _EditPlaylistState;

  factory EditPlaylistState.initial() => EditPlaylistState(
        name: PlaylistName(''),
        description: PlaylistDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        editFailureOrSuccessOption: none(),
      );
}
