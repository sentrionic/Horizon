part of 'update_account_cubit.dart';

@freezed
class UpdateAccountState with _$UpdateAccountState {
  const factory UpdateAccountState({
    required Username username,
    required EmailAddress emailAddress,
    required bool showErrorMessages,
    required bool isSaving,
    required Option<Either<AuthFailure, Account>> saveFailureOrSuccessOption,
  }) = _UpdateAccountState;

  factory UpdateAccountState.initial() => UpdateAccountState(
        username: Username(''),
        emailAddress: EmailAddress(''),
        showErrorMessages: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
