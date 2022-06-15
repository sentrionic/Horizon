import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) => AutoRouter.of(context).replace(
            const MainScreenRoute(),
          ),
          unauthenticated: (_) => AutoRouter.of(context).replace(
            const StartUpScreenRoute(),
          ),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
