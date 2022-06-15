import 'package:dartz/dartz.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/artist/artist_failure.dart';

abstract class IArtistRepository {
  Future<Either<ArtistFailure, List<Artist>>> searchArtists({
    required String query,
    int? page,
    int? limit,
  });

  Future<Either<ArtistFailure, Artist>> getArtist({
    required String id,
  });
}
