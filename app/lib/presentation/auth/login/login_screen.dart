import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/login_form/login_form_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/auth/login/login_form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<LoginFormCubit>()),
          BlocProvider(create: (_) => getIt<AccountCubit>()),
        ],
        child: LoginForm(),
      ),
    );
  }
}
