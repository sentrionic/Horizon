import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/auth_failure.dart';
import 'package:horizon/domain/auth/i_auth_facade.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'login_form_cubit.freezed.dart';
part 'login_form_state.dart';

@injectable
class LoginFormCubit extends Cubit<LoginFormState> {
  final IAuthFacade _authFacade;

  LoginFormCubit(this._authFacade) : super(LoginFormState.initial());

  /// Updates the [LoginFormState]'s [EmailAddress] value and resets the error.
  void emailChanged(String email) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(email),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [LoginFormState]'s [Password] value and resets the error.
  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: Password(password),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Signs in the user.
  ///
  /// Returns the [Account] of the user if successful, [AuthFailure] otherwise.
  Future<void> loginPressed() async {
    Either<AuthFailure, Account>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.login(
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
