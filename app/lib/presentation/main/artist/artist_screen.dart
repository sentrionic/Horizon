import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/artist/get_artist/get_artist_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/infrastructure/songs/song_extensions.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/widgets/category_header.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/artist/widgets/artist_header.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/tracks_list.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';

@RoutePage()
class ArtistScreen extends StatelessWidget {
  final String id;
  const ArtistScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetArtistCubit>()..getArtist(id),
      child: AppLayout(
        child: _ArtistsPage(
          id: id,
        ),
      ),
    );
  }
}

class _ArtistsPage extends HookWidget {
  final String id;
  const _ArtistsPage({required this.id});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    context.read<SongListCubit>().getSongs(
          artistId: id,
          order: SongOrder.plays,
        );

    return BlocListener<ToggleLikeCubit, ToggleLikeState>(
      listener: (context, state) {
        state.maybeWhen(
          toggleSuccess: (song) =>
              context.read<SongListCubit>().updateSong(song),
          orElse: () {},
        );
      },
      child: BlocBuilder<GetArtistCubit, GetArtistState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => WindowWrapper(
            appBar: NavigationAppbar(
              title: "Artist",
              controller: scrollController,
            ),
            controller: scrollController,
            children: const [
              SizedBox(),
            ],
          ),
          loadSuccess: (artist) => WindowWrapper(
            appBar: NavigationAppbar(
              title: artist.username,
              controller: scrollController,
            ),
            controller: scrollController,
            children: [
              ArtistHeader(
                artist: artist,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SongListCubit, SongListState>(
                builder: (context, state) => state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loadSuccess: (songs) => Column(
                    children: [
                      const CategoryHeader(
                        category: "Songs",
                        showMore: false,
                      ),
                      TracksList(
                        songs: songs,
                        currentID: id,
                        isDateAdded: false,
                        showHeader: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
