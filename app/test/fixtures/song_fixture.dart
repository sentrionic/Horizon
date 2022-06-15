import 'package:horizon/domain/songs/song.dart';

import 'faker.dart';
import 'user_fixture.dart';

Song getSongFixture() => Song(
      id: getRandomId(),
      title: getRandomName(),
      url: getRandomString(20),
      duration: getRandomInt(60, 300),
      isLiked: false,
      artist: getArtistFixture(),
    );

List<Song> getSongListFixture() {
  final List<Song> list = [];

  for (var i = 0; i < 5; i++) {
    list.add(getSongFixture());
  }

  return list;
}
