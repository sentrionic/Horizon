import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/playlists/create_playlist/create_playlist_cubit.dart';
import 'package:horizon/application/playlists/delete_playlist/delete_playlist_cubit.dart';
import 'package:horizon/application/playlists/edit_playlist/edit_playlist_cubit.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/add_playlist_tab.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/delete_playlist_dialog.dart';
import 'package:horizon/presentation/main/layout/side_menu/widgets/playlist_item.dart';
import 'package:horizon/presentation/main/playlist/widgets/edit_playlist_dialog.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class LibraryPlaylists extends HookWidget {
  const LibraryPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final tapPosition = useState<Offset>(Offset.zero);
    final id = AutoRouter.of(context).current.pathParams.get("id") as String?;
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          physics: const ClampingScrollPhysics(),
          children: [
            BlocBuilder<PlaylistListCubit, PlaylistListState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.maybeMap(
                      orElse: () => Container(),
                      loadSuccess: (state) => ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final playlist = state.playlists[index];
                          return PlaylistItem(
                            playlist: playlist,
                            isActive: playlist.id == id &&
                                AutoRouter.of(context).current.name ==
                                    PlaylistRoute.name,
                            onSecondaryTapDown: (value) =>
                                tapPosition.value = value.globalPosition,
                            onSecondaryTap: () => _showCustomMenu(
                              context,
                              tapPosition.value,
                              playlist,
                            ),
                          );
                        },
                        itemCount: state.playlists.length,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _showCustomMenu(
    BuildContext context,
    Offset offset,
    Playlist playlist,
  ) {
    final overlay = Overlay.of(context).context.findRenderObject()!;

    showMenu(
      color: ThemeColors.dialogColor,
      context: context,
      items: <PopupMenuEntry<int>>[
        PopupMenuItem(
          // Without future, the dialog won't be shown
          onTap: () => Future.delayed(
            Duration.zero,
            () => showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<EditPlaylistCubit>()..initialize(playlist),
                child: EditPlaylistDialog(id: playlist.id),
              ),
            ),
          ),
          child: const Text(
            "Edit details",
          ),
        ),
        PopupMenuItem(
          onTap: () => Future.delayed(
            Duration.zero,
            () => showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<DeletePlaylistCubit>(),
                child: DeletePlaylistDialog(
                  playlist: playlist,
                ),
              ),
            ),
          ),
          child: const Text(
            "Delete",
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () => Future.delayed(
            Duration.zero,
            () => showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<CreatePlaylistCubit>(),
                child: const CreatePlaylistDialog(),
              ),
            ),
          ),
          child: const Text(
            "Create playlist",
          ),
        ),
      ],
      position: RelativeRect.fromRect(
        offset & const Size(40, 40),
        Offset.zero & overlay.semanticBounds.size,
      ),
    );
  }
}
