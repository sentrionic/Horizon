import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/value_objects.dart';

import 'faker.dart';

Account getAccountFixture() {
  return Account(
    id: getRandomId(),
    username: Username(getRandomName()),
    email: EmailAddress(getRandomEmail()),
    image: getImageUrl(),
  );
}

Artist getArtistFixture() => Artist(
      id: getRandomId(),
      username: getRandomName(),
      image: getImageUrl(),
    );
