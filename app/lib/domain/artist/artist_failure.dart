import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_failure.freezed.dart';

@freezed
class ArtistFailure with _$ArtistFailure {
  const factory ArtistFailure.unexpected() = _Unexpected;
}
