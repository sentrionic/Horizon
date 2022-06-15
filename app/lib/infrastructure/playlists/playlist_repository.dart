import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/domain/playlists/i_playlist_repository.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/infrastructure/playlists/playlist_extensions.dart';
import 'package:horizon/infrastructure/proto/playlist_service.pbgrpc.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlaylistRepository)
class PlaylistRepository implements IPlaylistRepository {
  final PlaylistClient _client;
  final FlutterSecureStorage _storage;

  PlaylistRepository(this._client, this._storage);

  @override
  Future<Either<PlaylistFailure, List<Playlist>>> getPlaylists() async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.getPlaylists(
        GetPlaylistRequest(),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );
      final List<Playlist> playlists = [];

      for (final playlist in response.playlists) {
        playlists.add(playlist.toDomain());
      }

      return right(playlists);
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, Playlist>> createPlaylist(
    String name,
    String description,
  ) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.createPlaylist(
        CreatePlaylistRequest(
          name: name,
          description: description.isNotEmpty ? description : null,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, List<Song>>> getSongs(String id) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.getPlaylistSongs(
        PlaylistRequest(id: id),
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
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, Playlist>> deletePlaylist(String id) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.deletePlaylist(
        PlaylistRequest(id: id),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, Playlist>> updatePlaylist(
    String id,
    String name,
    String description,
  ) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.updatePlaylist(
        UpdatePlaylistRequest(
          playlistId: id,
          name: name,
          description: description.isNotEmpty ? description : null,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, Song>> addSong(
    String playlistId,
    String songId,
  ) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.addSong(
        PlaylistSongRequest(
          playlistId: playlistId,
          songId: songId,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }

  @override
  Future<Either<PlaylistFailure, Song>> removeSong(
    String playlistId,
    String songId,
  ) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.removeSong(
        PlaylistSongRequest(
          playlistId: playlistId,
          songId: songId,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const PlaylistFailure.unexpected());
    }
  }
}
