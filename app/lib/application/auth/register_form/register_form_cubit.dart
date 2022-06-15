import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/auth_failure.dart';
import 'package:horizon/domain/auth/i_auth_facade.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'register_form_cubit.freezed.dart';
part 'register_form_state.dart';

/// [RegisterFormCubit] manages the user sign up.
@injectable
class RegisterFormCubit extends Cubit<RegisterFormState> {
  final IAuthFacade _authFacade;

  RegisterFormCubit(this._authFacade) : super(RegisterFormState.initial());

  /// Updates the [RegisterFormState]'s [EmailAddress] value and resets the error.
  void emailChanged(String email) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(email),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [RegisterFormState]'s [EmailAddress] value and resets the error.
  void usernameChanged(String username) {
    emit(
      state.copyWith(
        username: Username(username),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [RegisterFormState]'s [EmailAddress] value and resets the error.
  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: Password(password),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Signs up the user.
  ///
  /// Returns the [Account] of the user if successful, [AuthFailure] otherwise.
  Future<void> registerPressed() async {
    Either<AuthFailure, Account>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isUsernameValid = state.username.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isUsernameValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.register(
        username: state.username,
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
