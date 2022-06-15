import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/songs/home_songs/home_songs_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/utils/time_utils.dart';
import 'package:horizon/presentation/common/widgets/category_header.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/home/widgets/home_songs_page.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeSongsCubit>()..getNewSongs(),
      child: const AppLayout(
        child: _HomePage(),
      ),
    );
  }
}

class _HomePage extends HookWidget {
  const _HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    context.read<SongListCubit>().getSongs(
          limit: 5,
          order: SongOrder.plays,
        );
    return BlocListener<ToggleLikeCubit, ToggleLikeState>(
      listener: (context, state) {
        state.maybeWhen(
          toggleSuccess: (song) {
            context.read<SongListCubit>().updateSong(song);
            context.read<HomeSongsCubit>().updateSong(song);
          },
          orElse: () {},
        );
      },
      child: WindowWrapper(
        appBar: NavigationAppbar(
          title: "Home",
          controller: _scrollController,
        ),
        controller: _scrollController,
        children: [
          Text(
            getTimeOfDay(),
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          CategoryHeader(
            category: "Top songs today",
            onClick: () => AutoRouter.of(context).push(
              HomeSongsPageRoute(
                query: SongQuery.popular,
              ),
            ),
          ),
          BlocBuilder<SongListCubit, SongListState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),
                loadSuccess: (songs) => TracksList(
                  songs: songs,
                  isDateAdded: false,
                  currentID: AppConstants.popularPlaylist,
                ),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CategoryHeader(
            category: "Newly added",
            onClick: () => AutoRouter.of(context).push(
              HomeSongsPageRoute(
                query: SongQuery.newlyAdded,
              ),
            ),
          ),
          BlocBuilder<HomeSongsCubit, HomeSongsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),
                loadSuccess: (songs) => TracksList(
                  songs: songs,
                  isDateAdded: false,
                  currentID: AppConstants.newPlaylist,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
