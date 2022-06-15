import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_failure.freezed.dart';

@freezed
class SongFailure with _$SongFailure {
  const factory SongFailure.unexpected() = _Unexpected;
}
