import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlaylistListCubit>()..getPlaylists(),
      child: const _LoadingIndicator(),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistListCubit, PlaylistListState>(
      listener: (context, state) {
        AutoRouter.of(context).replace(const HomeScreenRoute());
      },
      child: const SizedBox(),
    );
  }
}
