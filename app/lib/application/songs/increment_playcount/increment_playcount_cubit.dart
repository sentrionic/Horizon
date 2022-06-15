import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:injectable/injectable.dart';

part 'increment_playcount_state.dart';
part 'increment_playcount_cubit.freezed.dart';

@injectable
class IncrementPlaycountCubit extends Cubit<IncrementPlaycountState> {
  final ISongRepository _repository;
  IncrementPlaycountCubit(this._repository)
      : super(const IncrementPlaycountState.initial());

  Future<void> incrementPlayCount(String songId) async {
    emit(const IncrementPlaycountState.actionInProgress());
    final possibleFailure = await _repository.incrementPlayCount(songId);
    emit(
      possibleFailure.fold(
        (f) => IncrementPlaycountState.toggleFailure(f),
        (s) => IncrementPlaycountState.toggleSuccess(s),
      ),
    );
  }
}
