import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/playlists/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'edit_playlist_state.dart';
part 'edit_playlist_cubit.freezed.dart';

@injectable
class EditPlaylistCubit extends Cubit<EditPlaylistState> {
  final IPlaylistRepository _repository;

  EditPlaylistCubit(this._repository) : super(EditPlaylistState.initial());

  void initialize(Playlist playlist) => emit(
        state.copyWith(
          name: PlaylistName(playlist.name),
          description: PlaylistDescription(playlist.description ?? ""),
          editFailureOrSuccessOption: none(),
        ),
      );

  void nameChanged(String name) => emit(
        state.copyWith(
          name: PlaylistName(name),
          editFailureOrSuccessOption: none(),
        ),
      );

  void descriptionChanged(String description) => emit(
        state.copyWith(
          description: PlaylistDescription(description),
          editFailureOrSuccessOption: none(),
        ),
      );

  Future<void> editPlaylist(String id) async {
    Either<PlaylistFailure, Playlist>? failureOrSuccess;

    final isNameValid = state.name.isValid();
    final isDescriptionValid = state.description.isValid();

    if (isNameValid && isDescriptionValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          editFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.updatePlaylist(
        id,
        state.name.getOrCrash(),
        state.description.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        editFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
