import 'package:dartz/dartz.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';

abstract class ISongRepository {
  Future<Either<SongFailure, List<Song>>> getSongs({
    int? page,
    int? limit,
    String? artistId,
    String? query,
    SongOrder? order,
  });

  Future<Either<SongFailure, List<Song>>> getLikedSongs({
    int? page,
    int? limit,
    String? artistId,
    String? query,
  });

  Future<Either<SongFailure, Song>> toggleLike(String id);

  Future<Either<SongFailure, Song>> incrementPlayCount(String id);
}
