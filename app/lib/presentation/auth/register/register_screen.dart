import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/register_form/register_form_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/auth/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          // Used to register the user
          BlocProvider(create: (_) => getIt<RegisterFormCubit>()),
          // Used for storing the user's account info
          BlocProvider(create: (_) => getIt<AccountCubit>()),
        ],
        child: const RegisterForm(),
      ),
    );
  }
}
