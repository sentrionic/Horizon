import 'package:dartz/dartz.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/domain/playlists/playlist_failure.dart';
import 'package:horizon/domain/songs/song.dart';

abstract class IPlaylistRepository {
  Future<Either<PlaylistFailure, List<Playlist>>> getPlaylists();

  Future<Either<PlaylistFailure, Playlist>> createPlaylist(
    String name,
    String description,
  );

  Future<Either<PlaylistFailure, Playlist>> updatePlaylist(
    String id,
    String name,
    String description,
  );

  Future<Either<PlaylistFailure, Playlist>> deletePlaylist(
    String id,
  );

  Future<Either<PlaylistFailure, Song>> addSong(
    String playlistId,
    String songId,
  );

  Future<Either<PlaylistFailure, Song>> removeSong(
    String playlistId,
    String songId,
  );

  Future<Either<PlaylistFailure, List<Song>>> getSongs(
    String id,
  );
}
