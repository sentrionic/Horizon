import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/application/playlists/playlist_songs/playlist_songs_cubit.dart';
import 'package:horizon/application/playlists/remove_song/remove_song_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/playlist/widgets/playlist_header.dart';

class PlaylistScreen extends StatelessWidget {
  final String id;
  const PlaylistScreen({
    super.key,
    @PathParam("id") required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlaylistSongsCubit>()..getSongs(id),
      child: AppLayout(
        child: _PlaylistScreenBody(
          id: id,
        ),
      ),
    );
  }
}

class _PlaylistScreenBody extends HookWidget {
  final String id;
  const _PlaylistScreenBody({required this.id});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return MultiBlocListener(
      listeners: [
        BlocListener<ToggleLikeCubit, ToggleLikeState>(
          listener: (context, state) {
            state.maybeWhen(
              toggleSuccess: (song) =>
                  context.read<PlaylistSongsCubit>().updateSong(song),
              orElse: () {},
            );
          },
        ),
        BlocListener<RemoveSongCubit, RemoveSongState>(
          listener: (context, state) {
            print(state);
            state.maybeWhen(
              removeSuccess: (song) =>
                  context.read<PlaylistSongsCubit>().removeSong(song),
              orElse: () {},
            );
          },
        ),
      ],
      child: WindowWrapper(
        appBar: NavigationAppbar(
          title: context.read<PlaylistListCubit>().getPlaylist(id)?.name ??
              "Playlist",
          controller: scrollController,
        ),
        controller: scrollController,
        children: [
          PlaylistHeader(
            id: id,
          ),
          BlocBuilder<PlaylistSongsCubit, PlaylistSongsState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => Container(),
              loadSuccess: (songs) => TracksList(
                songs: songs,
                currentID: id,
                playlistID: id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
