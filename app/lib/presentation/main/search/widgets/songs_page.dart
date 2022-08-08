import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/search/widgets/search_appbar.dart';

class SongsPage extends StatelessWidget {
  final String query;
  const SongsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: _SongsPage(
        query: query,
      ),
    );
  }
}

class _SongsPage extends HookWidget {
  final String query;
  const _SongsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final textController = useTextEditingController(text: query);
    context.read<SongListCubit>().getSongs(query: query);

    return BlocListener<ToggleLikeCubit, ToggleLikeState>(
      listener: (context, state) {
        state.maybeWhen(
          toggleSuccess: (song) =>
              context.read<SongListCubit>().updateSong(song),
          orElse: () {},
        );
      },
      child: WindowWrapper(
        appBar: SearchAppbar(
          controller: textController,
          onSearch: (value) =>
              context.read<SongListCubit>().getSongs(query: value),
        ),
        controller: scrollController,
        children: [
          BlocBuilder<SongListCubit, SongListState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              loadSuccess: (songs) => TracksList(
                songs: songs,
                currentID: AppConstants.searchPlaylist,
                isDateAdded: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
