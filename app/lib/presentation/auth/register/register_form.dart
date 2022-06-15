import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/application/auth/register_form/register_form_cubit.dart';
import 'package:horizon/presentation/auth/widgets/auth_form_field.dart';
import 'package:horizon/presentation/auth/widgets/auth_wrapper.dart';
import 'package:horizon/presentation/auth/widgets/password_form_field.dart';
import 'package:horizon/presentation/common/utils/flushbar_creator.dart';
import 'package:horizon/presentation/common/widgets/form_wrapper.dart';
import 'package:horizon/presentation/common/widgets/linear_loading_indicator.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormCubit, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (account) {
              // Store the account and go to the projects page
              context.read<AccountCubit>().setAccount(account);
              context
                  .read<AuthStatusBloc>()
                  .add(const AuthStatusEvent.authCheckRequested());
              AutoRouter.of(context).replace(const MainScreenRoute());
            },
          ),
        );
      },
      builder: (context, state) {
        return AuthWrapper(
          width: MediaQuery.of(context).size.width / 2,
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: FormWrapper(
              children: [
                const Text(
                  "Horizon",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Sign up for a free\nHorizon account.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                AuthFormField(
                  hint: "Email",
                  icon: Icons.email_outlined,
                  onChanged: (value) =>
                      context.read<RegisterFormCubit>().emailChanged(value),
                  validator: () => context
                      .read<RegisterFormCubit>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => "Invalid Email",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 20),
                PasswordFormField(
                  "Create a password",
                  (value) =>
                      context.read<RegisterFormCubit>().passwordChanged(value),
                  () => context
                      .read<RegisterFormCubit>()
                      .state
                      .password
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          shortPassword: (_) => "Password is too short",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthFormField(
                  hint: 'What should we call you?',
                  icon: Icons.account_circle_outlined,
                  onChanged: (value) =>
                      context.read<RegisterFormCubit>().usernameChanged(value),
                  validator: () => context
                      .read<RegisterFormCubit>()
                      .state
                      .username
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidUsername: (_) => "Invalid Username",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<RegisterFormCubit>().registerPressed();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: const Text(
                            "CONTINUE",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.isSubmitting) const LinearLoadingIndicator(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already on Horizon?"),
                    TextButton(
                      onPressed: () => AutoRouter.of(context)
                          .replace(const LoginScreenRoute()),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
