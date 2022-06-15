import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

/// [AccountCubit] stores the current user's account information.
@injectable
class AccountCubit extends HydratedCubit<Account> {
  AccountCubit() : super(Account.empty());

  void setAccount(Account account) => emit(
        state.copyWith(
          id: account.id,
          username: account.username,
          image: account.image,
          email: account.email,
        ),
      );

  @override
  Account? fromJson(Map<String, dynamic> json) {
    final account = json['account'];
    if (account == null) return null;
    return Account(
      id: account['id'] as String,
      username: Username(account['username'] as String),
      email: EmailAddress(account['email'] as String),
      image: account['image'] as String,
    );
  }

  @override
  Map<String, dynamic>? toJson(Account state) => {
        "account": {
          "id": state.id,
          "username": state.username.getValue(),
          "email": state.email.getValue(),
          "image": state.image,
        }
      };
}
