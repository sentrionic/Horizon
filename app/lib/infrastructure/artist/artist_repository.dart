import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/artist/artist_failure.dart';
import 'package:horizon/domain/artist/i_artist_repository.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/infrastructure/artist/artist_extensions.dart';
import 'package:horizon/infrastructure/proto/artist_service.pbgrpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IArtistRepository)
class ArtistRepository implements IArtistRepository {
  final ArtistClient _client;
  final FlutterSecureStorage _storage;

  ArtistRepository(this._client, this._storage);

  @override
  Future<Either<ArtistFailure, Artist>> getArtist({required String id}) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.getArtist(
        ArtistRequest(id: id),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const ArtistFailure.unexpected());
    }
  }

  @override
  Future<Either<ArtistFailure, List<Artist>>> searchArtists({
    required String query,
    int? page,
    int? limit,
  }) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);
      final response = await _client.searchArtists(
        SearchArtistRequest(
          query: query,
          page: page,
          limit: limit,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );
      final List<Artist> artists = [];

      for (final artist in response.artists) {
        artists.add(artist.toDomain());
      }

      return right(artists);
    } catch (err) {
      print(err);
      return left(const ArtistFailure.unexpected());
    }
  }
}
