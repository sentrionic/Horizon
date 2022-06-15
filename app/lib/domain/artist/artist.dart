import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';

@freezed
class Artist with _$Artist {
  const Artist._();

  const factory Artist({
    required String id,
    required String username,
    required String image,
  }) = _Artist;
}
