import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/create_playlist/create_playlist_cubit.dart';
import 'package:horizon/application/playlists/delete_playlist/delete_playlist_cubit.dart';
import 'package:horizon/application/playlists/edit_playlist/edit_playlist_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/widget_sizes.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/add_playlist_tab.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/library_playlist.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/playlist_actions_listener.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/side_menu_icon_tab.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CreatePlaylistCubit>()),
        BlocProvider(create: (_) => getIt<EditPlaylistCubit>()),
        BlocProvider(create: (_) => getIt<DeletePlaylistCubit>()),
      ],
      child: const _SideMenuContent(),
    );
  }
}

class _SideMenuContent extends StatelessWidget {
  const _SideMenuContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = AutoRouter.of(context).current.name;
    return PlaylistActionsListener(
      child: Container(
        height: double.infinity,
        width: sideMenuWidth,
        color: Colors.black,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              SideMenuIconTab(
                iconData: Icons.home,
                title: 'Home',
                onTap: () =>
                    AutoRouter.of(context).push(const HomeScreenRoute()),
                isActive: current == HomeScreenRoute.name,
              ),
              SideMenuIconTab(
                iconData: Icons.search,
                title: 'Search',
                onTap: () =>
                    AutoRouter.of(context).push(const SearchScreenRoute()),
                isActive: current == SearchScreenRoute.name,
              ),
              const SizedBox(height: 12.0),
              AddPlaylistTab(
                cubit: context.read<CreatePlaylistCubit>(),
              ),
              const FavoriteSongsTab(),
              const SizedBox(height: 12.0),
              const Divider(
                thickness: 2,
                indent: 25,
                endIndent: 25,
              ),
              const LibraryPlaylists(),
            ],
          ),
        ),
      ),
    );
  }
}
