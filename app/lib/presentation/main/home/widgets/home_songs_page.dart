import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:horizon/presentation/common/utils/time_utils.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/playlist/widgets/playlist_info.dart';

enum SongQuery {
  newlyAdded,
  popular,
}

class HomeSongsPage extends StatelessWidget {
  final SongQuery query;
  const HomeSongsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: _SongPage(
        query: query,
      ),
    );
  }
}

class _SongPage extends HookWidget {
  final SongQuery query;
  const _SongPage({required this.query});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    context.read<SongListCubit>().getSongs(order: _getOrder(query));
    return BlocListener<ToggleLikeCubit, ToggleLikeState>(
      listener: (context, state) {
        state.maybeWhen(
          toggleSuccess: (song) =>
              context.read<SongListCubit>().updateSong(song),
          orElse: () {},
        );
      },
      child: WindowWrapper(
        appBar: NavigationAppbar(
          title: _getLabel(query),
          controller: scrollController,
        ),
        controller: scrollController,
        children: [
          BlocBuilder<SongListCubit, SongListState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              loadSuccess: (songs) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlayListInfo(
                    name: _getLabel(query),
                    info:
                        '${songs.length} songs, ${getPlaylistDuration(_getDurationSum(songs))}',
                    child: const SizedBox(),
                  ),
                  TracksList(
                    songs: songs,
                    currentID: _getLabel(query),
                    isDateAdded: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLabel(SongQuery query) {
    switch (query) {
      case SongQuery.newlyAdded:
        return "Newly added";
      case SongQuery.popular:
        return "Top songs today";
    }
  }

  SongOrder _getOrder(SongQuery query) {
    switch (query) {
      case SongQuery.newlyAdded:
        return SongOrder.created_at;
      case SongQuery.popular:
        return SongOrder.plays;
    }
  }

  int _getDurationSum(List<Song> songs) =>
      songs.fold<int>(0, (p, c) => p + c.duration);
}
