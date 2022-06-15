import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/playlists/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'create_playlist_state.dart';
part 'create_playlist_cubit.freezed.dart';

@injectable
class CreatePlaylistCubit extends Cubit<CreatePlaylistState> {
  final IPlaylistRepository _repository;

  CreatePlaylistCubit(this._repository) : super(CreatePlaylistState.initial());

  void nameChanged(String name) => emit(
        state.copyWith(
          name: PlaylistName(name),
          createFailureOrSuccessOption: none(),
        ),
      );

  void descriptionChanged(String description) => emit(
        state.copyWith(
          description: PlaylistDescription(description),
          createFailureOrSuccessOption: none(),
        ),
      );

  Future<void> createPlaylist() async {
    Either<PlaylistFailure, Playlist>? failureOrSuccess;

    final isNameValid = state.name.isValid();
    final isDescriptionValid = state.description.isValid();

    if (isNameValid && isDescriptionValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          createFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.createPlaylist(
        state.name.getOrCrash(),
        state.description.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        createFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
