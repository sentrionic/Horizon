import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:horizon/infrastructure/proto/song_service.pbgrpc.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISongRepository)
class SongRepository implements ISongRepository {
  final SongClient _client;
  final FlutterSecureStorage _storage;

  SongRepository(this._client, this._storage);

  @override
  Future<Either<SongFailure, List<Song>>> getSongs({
    int? page,
    int? limit,
    String? artistId,
    String? query,
    SongOrder? order,
  }) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.getSongs(
        Filter(
          page: page,
          limit: limit,
          artistId: artistId,
          query: query,
          order: order?.toString().split(".").last,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );
      final List<Song> songs = [];

      for (final song in response.songs) {
        songs.add(song.toDomain());
      }

      return right(songs);
    } catch (err) {
      print(err);
      return left(const SongFailure.unexpected());
    }
  }

  @override
  Future<Either<SongFailure, List<Song>>> getLikedSongs({
    int? page,
    int? limit,
    String? artistId,
    String? query,
  }) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.getLikedSongs(
        Filter(
          page: page,
          limit: limit,
          artistId: artistId,
          query: query,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );
      final List<Song> songs = [];

      for (final song in response.songs) {
        songs.add(song.toDomain());
      }

      return right(songs);
    } catch (err) {
      print(err);
      return left(const SongFailure.unexpected());
    }
  }

  @override
  Future<Either<SongFailure, Song>> toggleLike(String id) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.toggleLike(
        SongRequest(songId: id),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const SongFailure.unexpected());
    }
  }

  @override
  Future<Either<SongFailure, Song>> incrementPlayCount(String id) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.incrementPlayCount(
        SongRequest(songId: id),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const SongFailure.unexpected());
    }
  }
}
