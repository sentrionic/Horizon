import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/songs/liked_songs/liked_songs_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/liked_songs/widgets/liked_songs_header.dart';

class LikedSongsScreen extends StatelessWidget {
  const LikedSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LikedSongsCubit>()..getLikedSongs(),
      child: const AppLayout(
        child: _LikedSongsScreenBody(),
      ),
    );
  }
}

class _LikedSongsScreenBody extends HookWidget {
  const _LikedSongsScreenBody();

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return BlocListener<ToggleLikeCubit, ToggleLikeState>(
      listener: (context, state) {
        state.maybeWhen(
          toggleSuccess: (song) =>
              context.read<LikedSongsCubit>().removeSong(song),
          orElse: () {},
        );
      },
      child: WindowWrapper(
        appBar: NavigationAppbar(
          title: "Liked Songs",
          controller: scrollController,
        ),
        controller: scrollController,
        children: [
          BlocBuilder<LikedSongsCubit, LikedSongsState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              loadSuccess: (songs) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LikedSongsHeader(
                    songCount: songs.length,
                  ),
                  TracksList(
                    songs: songs,
                    currentID: AppConstants.likedPlaylist,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
