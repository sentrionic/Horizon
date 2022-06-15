import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/artist/search_artists/search_artists_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/category_header.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/search/widgets/artist_tile.dart';
import 'package:horizon/presentation/main/search/widgets/search_appbar.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SongListCubit>()),
        BlocProvider(create: (_) => getIt<SearchArtistsCubit>()),
      ],
      child: const AppLayout(
        child: _SearchScreenBody(),
      ),
    );
  }
}

class _SearchScreenBody extends HookWidget {
  const _SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    final _textController = useTextEditingController();
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
          controller: _textController,
          onSearch: (value) {
            context.read<SongListCubit>().getSongs(
                  limit: 5,
                  query: value,
                  order: SongOrder.plays,
                );
            context.read<SearchArtistsCubit>().getArtists(value, limit: 5);
          },
        ),
        controller: _scrollController,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Top Results",
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<SongListCubit, SongListState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => Container(),
              loadSuccess: (songs) => Column(
                children: [
                  CategoryHeader(
                    category: "Songs",
                    onClick: () => context.router.push(
                      SongsPageRoute(
                        query: _textController.text,
                      ),
                    ),
                    showMore: songs.isNotEmpty,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (songs.isNotEmpty)
                    TracksList(
                      songs: songs,
                      isDateAdded: false,
                      showHeader: false,
                      currentID: AppConstants.searchPlaylist,
                    )
                  else
                    const Text("Nothing found")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<SearchArtistsCubit, SearchArtistsState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => Container(),
              loadSuccess: (artists) => Column(
                children: [
                  CategoryHeader(
                    category: "Artists",
                    onClick: () => context.router.push(
                      ArtistsPageRoute(
                        query: _textController.text,
                      ),
                    ),
                    showMore: artists.isNotEmpty,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (artists.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: artists
                            .map(
                              (e) => ArtistTile(artist: e),
                            )
                            .toList(),
                      ),
                    )
                  else
                    const Text("Nothing found"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
