import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/infrastructure/proto/song.pb.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tSongDto = SongResponse(
    id: "d1c02e0c-300a-4e91-9311-c2544589ff9f",
    title: "Minimal Technology",
    url:
        "https://harmony-cdn.s3.eu-central-1.amazonaws.com/songs/5bf8086b-da53-45ab-adec-58ef00b4bfcb/Minimal%20Technology.mp3",
    duration: 119,
    plays: 10,
    isLiked: true,
    artist: ArtistResponse(
      id: "5bf8086b-da53-45ab-adec-58ef00b4bfcb",
      username: "Coma-Media",
      image:
          "https://gravatar.com/avatar/cf3cbbfad08823de6a5e7da4ba060b7f?d=identicon",
    ),
  );

  const tSong = Song(
    id: "d1c02e0c-300a-4e91-9311-c2544589ff9f",
    title: "Minimal Technology",
    url:
        "https://harmony-cdn.s3.eu-central-1.amazonaws.com/songs/5bf8086b-da53-45ab-adec-58ef00b4bfcb/Minimal%20Technology.mp3",
    duration: 119,
    plays: 10,
    isLiked: true,
    artist: Artist(
      id: "5bf8086b-da53-45ab-adec-58ef00b4bfcb",
      username: "Coma-Media",
      image:
          "https://gravatar.com/avatar/cf3cbbfad08823de6a5e7da4ba060b7f?d=identicon",
    ),
  );

  group('SongDto.fromJson', () {
    test(
      'should return a valid DTO when the JSON is valid',
      () async {
        // arrange
        final jsonMap = json.decode(fixture('song.json'));

        // act
        final result = SongResponse.create()..mergeFromProto3Json(jsonMap);

        // assert
        expect(result, tSongDto);
      },
    );

    test(
      'should return a domain model from the SongDto',
      () async {
        // arrange
        final jsonMap = json.decode(fixture('song.json'));

        // act
        final result = SongResponse.create()..mergeFromProto3Json(jsonMap);

        // assert
        expect(result.toDomain(), tSong);
      },
    );
  });
}
