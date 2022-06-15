import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/auth_failure.dart';
import 'package:horizon/domain/auth/i_auth_facade.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/infrastructure/auth/auth_extensions.dart';
import 'package:horizon/infrastructure/proto/auth_service.pbgrpc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final AuthClient _client;
  final FlutterSecureStorage _storage;

  AuthFacade(this._client, this._storage);

  @override
  Future<Either<AuthFailure, Account>> login({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailString = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final request = LoginRequest(
        email: emailString,
        password: passwordStr,
      );

      final response = await _client.login(request);

      _saveToken(response.accessToken);

      return right(response.account.toDomain());
    } catch (err) {
      print(err);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Account>> register({
    required EmailAddress emailAddress,
    required Username username,
    required Password password,
  }) async {
    final emailString = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final usernameStr = username.getOrCrash();

    try {
      final request = RegisterRequest(
        email: emailString,
        password: passwordStr,
        username: usernameStr,
      );

      final response = await _client.register(request);

      _saveToken(response.accessToken);

      return right(response.account.toDomain());
    } catch (err) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<bool> checkAuthenticated() async {
    final token = await _storage.read(key: AppConstants.tokenKey);
    return token != null;
  }

  @override
  Future<void> logout() async => _storage.delete(key: AppConstants.tokenKey);

  /// Stores the token on the phone
  Future<void> _saveToken(String authToken) async =>
      _storage.write(key: AppConstants.tokenKey, value: authToken);

  @override
  Future<Either<AuthFailure, Account>> updateAccount({
    required String email,
    required String username,
  }) async {
    try {
      final token = await _storage.read(key: AppConstants.tokenKey);

      final response = await _client.update(
        UpdateRequest(
          email: email,
          username: username,
        ),
        options: CallOptions(
          metadata: {"Authorization": token ?? ""},
        ),
      );

      return right(response.toDomain());
    } catch (err) {
      print(err);
      return left(const AuthFailure.serverError());
    }
  }
}
