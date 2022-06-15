part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Account>> authFailureOrSuccessOption,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
