import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:injectable/injectable.dart';

part 'toggle_like_state.dart';
part 'toggle_like_cubit.freezed.dart';

@injectable
class ToggleLikeCubit extends Cubit<ToggleLikeState> {
  final ISongRepository _repository;
  ToggleLikeCubit(this._repository) : super(const ToggleLikeState.initial());

  Future<void> toggleLike(String songId) async {
    emit(const ToggleLikeState.actionInProgress());
    final possibleFailure = await _repository.toggleLike(songId);
    emit(
      possibleFailure.fold(
        (f) => ToggleLikeState.toggleFailure(f),
        (s) => ToggleLikeState.toggleSuccess(s),
      ),
    );
  }
}
