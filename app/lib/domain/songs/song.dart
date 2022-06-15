import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/artist/artist.dart';

part 'song.freezed.dart';

/// [Song] represents the song model.
@freezed
class Song with _$Song {
  const Song._();

  const factory Song({
    required String id,
    required String title,
    required String url,
    int? plays,
    required int duration,
    String? dateAdded,
    required bool isLiked,
    required Artist artist,
  }) = _Song;
}
