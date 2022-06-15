import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:injectable/injectable.dart';

part 'song_list_state.dart';
part 'song_list_cubit.freezed.dart';

@injectable
class SongListCubit extends Cubit<SongListState> {
  final ISongRepository _repository;

  SongListCubit(this._repository) : super(const SongListState.initial());

  Future<void> getSongs({
    int? page,
    int? limit,
    String? artistId,
    String? query,
    SongOrder? order,
  }) async {
    emit(const SongListState.loadInProgress());
    final failureOrSongs = await _repository.getSongs(
      page: page,
      limit: limit,
      artistId: artistId,
      query: query,
      order: order,
    );
    emit(
      failureOrSongs.fold(
        (f) => SongListState.loadFailure(f),
        (songs) => SongListState.loadSuccess(songs),
      ),
    );
  }

  void reset() => emit(const SongListState.loadSuccess([]));

  void updateSong(Song song) {
    state.maybeWhen(
      loadSuccess: (songs) async {
        final data = songs
            .map(
              (s) => s.id == song.id
                  ? s.copyWith(
                      isLiked: song.isLiked,
                    )
                  : s,
            )
            .toList();
        emit(SongListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
