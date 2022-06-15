import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/infrastructure/artist/artist_extensions.dart';
import 'package:horizon/infrastructure/proto/song.pb.dart';

enum SongOrder {
  // ignore: constant_identifier_names
  created_at,
  plays
}

extension SongDto on SongResponse {
  Song toDomain() => Song(
        id: id,
        title: title,
        url: url,
        plays: plays,
        duration: duration,
        isLiked: isLiked,
        artist: artist.toDomain(),
      );
}

extension PlaylistSongDto on PlaylistSongResponse {
  Song toDomain() => Song(
        id: id,
        title: title,
        url: url,
        dateAdded: dateAdded,
        duration: duration,
        isLiked: isLiked,
        artist: artist.toDomain(),
      );
}
