import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/infrastructure/proto/song.pb.dart';

extension ArtistDto on ArtistResponse {
  Artist toDomain() => Artist(
        id: id,
        username: username,
        image: image,
      );
}
