import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/core/app_theme.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthStatusBloc>()
            ..add(const AuthStatusEvent.authCheckRequested()),
        ),
        BlocProvider(create: (_) => getIt<AudioPlayerCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Horizon',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: theme,
      ),
    );
  }
}
