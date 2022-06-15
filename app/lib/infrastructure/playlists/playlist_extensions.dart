import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/infrastructure/proto/playlist.pb.dart';

extension PlaylistDto on PlaylistResponse {
  Playlist toDomain() => Playlist(
        id: id,
        name: name,
        description: description,
        duration: duration,
        songCount: songCount,
        owner: owner,
      );
}
