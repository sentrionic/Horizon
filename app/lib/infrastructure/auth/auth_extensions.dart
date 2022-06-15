import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:horizon/infrastructure/proto/account.pb.dart';

extension AccountDto on AccountResponse {
  Account toDomain() => Account(
        id: id,
        username: Username(username),
        email: EmailAddress(email),
        image: image,
      );
}
