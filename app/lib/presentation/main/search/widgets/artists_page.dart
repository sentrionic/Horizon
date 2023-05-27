import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/artist/search_artists/search_artists_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';
import 'package:horizon/presentation/main/search/widgets/artist_tile.dart';
import 'package:horizon/presentation/main/search/widgets/search_appbar.dart';

@RoutePage()
class ArtistsPage extends StatelessWidget {
  final String query;
  const ArtistsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchArtistsCubit>(),
      child: AppLayout(
        child: _ArtistsPage(
          query: query,
        ),
      ),
    );
  }
}

class _ArtistsPage extends HookWidget {
  final String query;
  const _ArtistsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final textController = useTextEditingController(text: query);
    context.read<SearchArtistsCubit>().getArtists(query);

    return WindowWrapper(
      appBar: SearchAppbar(
        controller: textController,
        onSearch: (value) =>
            context.read<SearchArtistsCubit>().getArtists(value),
      ),
      controller: scrollController,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'All artists for "$query"',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        BlocBuilder<SearchArtistsCubit, SearchArtistsState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox(),
            loadSuccess: (artists) => Align(
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
            ),
          ),
        )
      ],
    );
  }
}
