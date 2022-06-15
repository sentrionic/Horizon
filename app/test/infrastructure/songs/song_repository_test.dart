import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:horizon/infrastructure/proto/song.pb.dart';
import 'package:horizon/infrastructure/proto/song_service.pbgrpc.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:horizon/infrastructure/songs/song_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';
import '../helpers/mock_response_future.dart';

class MockSongClient extends Mock implements SongClient {}

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late SongRepository repository;
  late MockSecureStorage storage;
  late MockSongClient client;

  setUp(() {
    storage = MockSecureStorage();
    client = MockSongClient();

    repository = SongRepository(client, storage);
  });

  group('SongRepository', () {
    group('GetSongs', () {
      final data = fixture('song_list.json');
      final result = json.decode(data);

      final List<Song> songs = [];
      final List<SongResponse> response = [];

      result.forEach((s) {
        final res = SongResponse.create()..mergeFromProto3Json(s);
        response.add(res);
        songs.add(res.toDomain());
      });

      test(
        "should perform a request to the network to get the songs",
        () async {
          // arrange
          when(() => storage.read(key: AppConstants.tokenKey))
              .thenAnswer((_) => Future.value("token"));

          when(
            () => client.getSongs(
              Filter(),
              options: any(named: "options"),
            ),
          ).thenAnswer(
            (_) => MockResponseFuture<SongList>.value(
              SongList(songs: response),
            ),
          );

          // act
          await repository.getSongs();

          // assert
          verify(() => storage.read(key: AppConstants.tokenKey)).called(1);

          verify(
            () => client.getSongs(
              Filter(),
              options: any(named: "options"),
            ),
          ).called(1);
        },
      );

      test(
        'should return a list of songs when the response code success',
        () async {
          // arrange
          when(() => storage.read(key: AppConstants.tokenKey))
              .thenAnswer((_) => Future.value("token"));

          when(
            () => client.getSongs(
              Filter(),
              options: any(named: "options"),
            ),
          ).thenAnswer(
            (_) => MockResponseFuture<SongList>.value(
              SongList(songs: response),
            ),
          );

          // act
          final result = await repository.getSongs();

          // assert
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), equals(songs));
        },
      );

      test(
        'should return a SongFailure when an error is thrown',
        () async {
          // arrange
          when(() => storage.read(key: AppConstants.tokenKey))
              .thenAnswer((_) => Future.value("token"));

          when(
            () => client.getSongs(
              Filter(),
              options: any(named: "options"),
            ),
          ).thenAnswer(
            (_) => MockResponseFuture<SongList>.error(
              any,
            ),
          );

          // act
          final result = await repository.getSongs();

          // assert
          expect(result.isLeft(), true);

          final value = result.fold(id, id);

          expect(
            value,
            equals(const SongFailure.unexpected()),
          );
        },
      );
    });
  });
}
