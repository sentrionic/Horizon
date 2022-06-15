import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:injectable/injectable.dart';

part 'liked_songs_state.dart';
part 'liked_songs_cubit.freezed.dart';

@injectable
class LikedSongsCubit extends Cubit<LikedSongsState> {
  final ISongRepository _repository;

  LikedSongsCubit(this._repository) : super(const LikedSongsState.initial());

  Future<void> getLikedSongs({
    int? page,
    int? limit,
    String? query,
  }) async {
    emit(const LikedSongsState.loadInProgress());
    final failureOrSongs = await _repository.getLikedSongs(
      page: page,
      limit: limit,
      query: query,
    );
    emit(
      failureOrSongs.fold(
        (f) => LikedSongsState.loadFailure(f),
        (songs) => LikedSongsState.loadSuccess(songs),
      ),
    );
  }

  void removeSong(Song song) {
    state.maybeWhen(
      loadSuccess: (songs) async {
        final data = songs.where((s) => s.id != song.id).toList();
        emit(LikedSongsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
