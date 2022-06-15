import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/application/auth/login_form/login_form_cubit.dart';
import 'package:horizon/presentation/auth/widgets/auth_form_field.dart';
import 'package:horizon/presentation/auth/widgets/auth_wrapper.dart';
import 'package:horizon/presentation/auth/widgets/password_form_field.dart';
import 'package:horizon/presentation/common/utils/flushbar_creator.dart';
import 'package:horizon/presentation/common/widgets/form_wrapper.dart';
import 'package:horizon/presentation/common/widgets/linear_loading_indicator.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return BlocConsumer<LoginFormCubit, LoginFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  invalidCredentials: (_) => "Invalid Credentials",
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
                  "Log in to continue",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthFormField(
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  onChanged: (value) =>
                      context.read<LoginFormCubit>().emailChanged(value),
                  validator: () => context
                      .read<LoginFormCubit>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordFormField(
                  'Password',
                  (value) =>
                      context.read<LoginFormCubit>().passwordChanged(value),
                  () =>
                      context.read<LoginFormCubit>().state.password.value.fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => 'Short Password',
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
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<LoginFormCubit>().loginPressed();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: const Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
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
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => AutoRouter.of(context)
                          .replace(const RegisterScreenRoute()),
                      child: const Text(
                        "SIGNUP",
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
