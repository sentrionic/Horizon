import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/auth/auth_failure.dart';
import 'package:horizon/domain/auth/i_auth_facade.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'update_account_state.dart';
part 'update_account_cubit.freezed.dart';

/// [UpdateAccountCubit] manages the update of the user's account information.
@injectable
class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  final IAuthFacade _authFacade;

  UpdateAccountCubit(this._authFacade) : super(UpdateAccountState.initial());

  /// Sets the initial values for the to be updated account.
  void initialize(Account account) => emit(
        state.copyWith(
          emailAddress: account.email,
          username: account.username,
        ),
      );

  /// Updates the [UpdateAccountCubit]'s [EmailAddress] value and resets the error.
  void emailChanged(String email) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(email),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [UpdateAccountCubit]'s [EmailAddress] value and resets the error.
  void usernameChanged(String username) {
    emit(
      state.copyWith(
        username: Username(username),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the update account request.
  ///
  /// Emits the updated [Account] if successful, [AuthFailure] otherwise.
  Future<void> updateAccount() async {
    Either<AuthFailure, Account>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isUsernameValid = state.username.isValid();

    if (isEmailValid && isUsernameValid) {
      emit(
        state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.updateAccount(
        username: state.username.getOrCrash(),
        email: state.emailAddress.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
