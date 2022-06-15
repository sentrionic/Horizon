import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horizon/application/auth/register_form/register_form_cubit.dart';
import 'package:horizon/domain/auth/auth_failure.dart';
import 'package:horizon/domain/auth/i_auth_facade.dart';
import 'package:horizon/domain/auth/value_objects.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/faker.dart';
import '../../fixtures/user_fixture.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

void main() {
  late MockAuthFacade authFacade;

  setUp(() => authFacade = MockAuthFacade());

  group('RegisterFormCubit', () {
    group('emailChanged', () {
      final mockAccount = getAccountFixture();
      final email = mockAccount.email.getOrCrash();

      blocTest<RegisterFormCubit, RegisterFormState>(
        'emits the new [EmailAddress]',
        build: () => RegisterFormCubit(authFacade),
        act: (cubit) => cubit.emailChanged(email),
        expect: () => [
          RegisterFormState.initial().copyWith(
            emailAddress: EmailAddress(email),
            authFailureOrSuccessOption: none(),
          ),
        ],
      );
    });

    group('usernameChanged', () {
      final mockAccount = getAccountFixture();
      final username = mockAccount.username.getOrCrash();

      blocTest<RegisterFormCubit, RegisterFormState>(
        'emits the new [Username]',
        build: () => RegisterFormCubit(authFacade),
        act: (cubit) => cubit.usernameChanged(username),
        expect: () => [
          RegisterFormState.initial().copyWith(
            username: Username(username),
            authFailureOrSuccessOption: none(),
          ),
        ],
      );
    });

    group('passwordChanged', () {
      final password = getRandomString(16);

      blocTest<RegisterFormCubit, RegisterFormState>(
        'emits the new [Password]',
        build: () => RegisterFormCubit(authFacade),
        act: (cubit) => cubit.passwordChanged(password),
        expect: () => [
          RegisterFormState.initial().copyWith(
            password: Password(password),
            authFailureOrSuccessOption: none(),
          ),
        ],
      );
    });
  });

  group('RegisterPressed', () {
    final mockAccount = getAccountFixture();
    final password = Password(getRandomString(20));
    final state = RegisterFormState.initial();

    test('initial RegisterFormState should be RegisterFormState.initial()', () {
      final cubit = RegisterFormCubit(authFacade);
      // assert
      expect(cubit.state, equals(RegisterFormState.initial()));
    });

    blocTest<RegisterFormCubit, RegisterFormState>(
      'emits the account for successful registration',
      setUp: () => when(
        () => authFacade.register(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
        ),
      ).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 1),
          () => right(mockAccount),
        ),
      ),
      build: () => RegisterFormCubit(authFacade),
      seed: () => state.copyWith(
        emailAddress: mockAccount.email,
        password: password,
        username: mockAccount.username,
      ),
      act: (cubit) => cubit.registerPressed(),
      expect: () => [
        state.copyWith(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
          isSubmitting: true,
          showErrorMessages: false,
          authFailureOrSuccessOption: none(),
        ),
        state.copyWith(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: some(right(mockAccount)),
        ),
      ],
      verify: (_) {
        verify(
          () => authFacade.register(
            emailAddress: mockAccount.email,
            password: password,
            username: mockAccount.username,
          ),
        ).called(1);
      },
    );

    blocTest<RegisterFormCubit, RegisterFormState>(
      'emits [AuthFailure] for unsuccessful registration',
      setUp: () => when(
        () => authFacade.register(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
        ),
      ).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 1),
          () => left(const AuthFailure.serverError()),
        ),
      ),
      build: () => RegisterFormCubit(authFacade),
      seed: () => state.copyWith(
        emailAddress: mockAccount.email,
        password: password,
        username: mockAccount.username,
      ),
      act: (cubit) => cubit.registerPressed(),
      expect: () => [
        state.copyWith(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
          isSubmitting: true,
          showErrorMessages: false,
          authFailureOrSuccessOption: none(),
        ),
        state.copyWith(
          emailAddress: mockAccount.email,
          password: password,
          username: mockAccount.username,
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption:
              some(left(const AuthFailure.serverError())),
        ),
      ],
      verify: (_) {
        verify(
          () => authFacade.register(
            emailAddress: mockAccount.email,
            password: password,
            username: mockAccount.username,
          ),
        ).called(1);
      },
    );
  });
}
