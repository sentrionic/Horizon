part of 'create_playlist_cubit.dart';

@freezed
class CreatePlaylistState with _$CreatePlaylistState {
  const factory CreatePlaylistState({
    required PlaylistName name,
    required PlaylistDescription description,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<PlaylistFailure, Playlist>>
        createFailureOrSuccessOption,
  }) = _CreatePlaylistState;

  factory CreatePlaylistState.initial() => CreatePlaylistState(
        name: PlaylistName(''),
        description: PlaylistDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        createFailureOrSuccessOption: none(),
      );
}
