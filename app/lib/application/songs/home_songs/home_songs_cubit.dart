import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:injectable/injectable.dart';

part 'home_songs_state.dart';
part 'home_songs_cubit.freezed.dart';

@injectable
class HomeSongsCubit extends Cubit<HomeSongsState> {
  final ISongRepository _repository;

  HomeSongsCubit(this._repository) : super(const HomeSongsState.initial());

  Future<void> getNewSongs({
    int? page,
    int? limit,
  }) async {
    emit(const HomeSongsState.loadInProgress());
    final failureOrSongs = await _repository.getSongs(
      limit: 5,
      order: SongOrder.created_at,
    );
    emit(
      failureOrSongs.fold(
        (f) => HomeSongsState.loadFailure(f),
        (songs) => HomeSongsState.loadSuccess(songs),
      ),
    );
  }

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
        emit(HomeSongsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
