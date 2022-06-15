import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist.freezed.dart';

/// [Playlist] represents the playlist model.
@freezed
class Playlist with _$Playlist {
  const Playlist._();

  const factory Playlist({
    required String id,
    required String name,
    String? description,
    required String owner,
    required int duration,
    required int songCount,
  }) = _Playlist;
}
