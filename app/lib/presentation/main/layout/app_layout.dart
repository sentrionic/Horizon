import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/application/playlists/add_song/add_song_cubit.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/application/playlists/remove_song/remove_song_cubit.dart';
import 'package:horizon/application/songs/increment_playcount/increment_playcount_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/title_bar.dart';
import 'package:horizon/presentation/main/layout/controls/audio_controls.dart';
import 'package:horizon/presentation/main/layout/side_menu/side_menu.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AccountCubit>()),
        BlocProvider(create: (_) => getIt<PlaylistListCubit>()),
        BlocProvider(create: (_) => getIt<ToggleLikeCubit>()),
        BlocProvider(create: (_) => getIt<SongListCubit>()),
        BlocProvider(create: (_) => getIt<IncrementPlaycountCubit>()),
        BlocProvider(create: (_) => getIt<AddSongCubit>()),
        BlocProvider(create: (_) => getIt<RemoveSongCubit>()),
      ],
      child: BlocListener<AuthStatusBloc, AuthStatusState>(
        listener: (context, state) {
          state.maybeMap(
            unauthenticated: (_) =>
                AutoRouter.of(context).replace(const StartUpScreenRoute()),
            orElse: () {},
          );
        },
        child: Scaffold(
          body: Column(
            children: [
              const TitleBar(),
              Expanded(
                child: Row(
                  children: [
                    const SideMenu(),
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
              ),
              AudioControls(),
            ],
          ),
        ),
      ),
    );
  }
}
