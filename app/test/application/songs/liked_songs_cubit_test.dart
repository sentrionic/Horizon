import 'package:bloc_test/bloc_test.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horizon/application/songs/liked_songs/liked_songs_cubit.dart';
import 'package:horizon/domain/songs/i_song_repository.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/domain/songs/song_failure.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/song_fixture.dart';
import '../helpers/hydrated_cubit.dart';

class MockSongRepository extends Mock implements ISongRepository {}

void main() {
  late MockSongRepository repository;

  setUp(() => repository = MockSongRepository());

  void _setUpGetSongsSuccess(List<Song> songs) {
    when(() => repository.getLikedSongs()).thenAnswer(
      (_) => Future.delayed(
        const Duration(milliseconds: 1),
        () => right(songs),
      ),
    );
  }

  group('LikedSongsCubit', () {
    final songs = getSongListFixture();

    test('initial LikedSongsState should be LikedSongsState.initial()', () {
      mockHydratedStorage(() {
        final cubit = LikedSongsCubit(repository);
        // assert
        expect(cubit.state, equals(const LikedSongsState.initial()));
      });
    });

    blocTest<LikedSongsCubit, LikedSongsState>(
      'emits [loadInProgress, loadSuccess] states for successful song list fetch',
      setUp: () => _setUpGetSongsSuccess(songs),
      build: () => mockHydratedStorage(() => LikedSongsCubit(repository)),
      act: (cubit) => cubit.getLikedSongs(),
      expect: () => [
        const LikedSongsState.loadInProgress(),
        LikedSongsState.loadSuccess(songs),
      ],
      verify: (_) {
        verify(() => repository.getLikedSongs()).called(1);
      },
    );

    blocTest<LikedSongsCubit, LikedSongsState>(
      'emits [loadInProgress, loadFailure] states for unsuccessful song list fetch',
      setUp: () => when(() => repository.getLikedSongs()).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 1),
          () => left(const SongFailure.unexpected()),
        ),
      ),
      build: () => mockHydratedStorage(() => LikedSongsCubit(repository)),
      act: (cubit) => cubit.getLikedSongs(),
      expect: () => [
        const LikedSongsState.loadInProgress(),
        const LikedSongsState.loadFailure(SongFailure.unexpected())
      ],
      verify: (_) {
        verify(() => repository.getLikedSongs()).called(1);
      },
    );
  });

  group('RemoveSong', () {
    final songs = getSongListFixture();
    final mockSong = getSongFixture();

    blocTest<LikedSongsCubit, LikedSongsState>(
      'successfully removes the song for the given songId',
      build: () => mockHydratedStorage(() => LikedSongsCubit(repository)),
      seed: () => LikedSongsState.loadSuccess([...songs, mockSong]),
      act: (cubit) => cubit.removeSong(mockSong),
      expect: () => [
        LikedSongsState.loadSuccess(songs),
      ],
    );

    test('removes the song from the list', () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = LikedSongsCubit(repository);
        _setUpGetSongsSuccess([...songs, mockSong]);
        await cubit.getLikedSongs();

        // act
        cubit.removeSong(mockSong);

        // assert
        expect(
          cubit.state,
          equals(LikedSongsState.loadSuccess(songs)),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSongs) {
            expect(stateSongs.length, songs.length);
            expect(
              stateSongs.where((s) => s.id == mockSong.id).firstOrNull,
              null,
            );
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });

    test(
        'does not remove the song if the state is not LikedSongsState.loadSuccess()',
        () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = LikedSongsCubit(repository);

        // act
        cubit.removeSong(mockSong);

        // assert
        expect(cubit.state, equals(const LikedSongsState.initial()));
      });
    });

    test('does not remove a song if it cannot find a song for the id',
        () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = LikedSongsCubit(repository);
        _setUpGetSongsSuccess(songs);
        await cubit.getLikedSongs();

        // act
        cubit.removeSong(mockSong);

        // assert
        expect(
          cubit.state,
          equals(LikedSongsState.loadSuccess(songs)),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSongs) {
            expect(stateSongs.length, songs.length);
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });
  });
}
