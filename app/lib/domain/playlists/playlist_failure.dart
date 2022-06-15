import 'package:freezed_annotation/freezed_annotation.dart';

part 'playlist_failure.freezed.dart';

@freezed
class PlaylistFailure with _$PlaylistFailure {
  const factory PlaylistFailure.unexpected() = _Unexpected;
}
