import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/add_song/add_song_cubit.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/application/playlists/remove_song/remove_song_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:horizon/presentation/main/layout/track_list/widgets/popup_submenu_item.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

void showTrackContextMenu(
  BuildContext context,
  Offset offset,
  Song song,
  String? playlistID,
) {
  final overlay = Overlay.of(context)!.context.findRenderObject()!;
  showMenu(
    color: ThemeColors.dialogColor,
    context: context,
    items: <PopupMenuEntry>[
      PopupMenuItem(
        onTap: () => context.router.push(
          ArtistScreenRoute(id: song.artist.id),
        ),
        child: const Text(
          "Go to artist",
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem(
        onTap: () => context.read<ToggleLikeCubit>().toggleLike(song.id),
        child: Text(
          "${song.isLiked ? "Remove from" : "Save to"} your Liked Songs",
        ),
      ),
      if (playlistID != null)
        PopupMenuItem(
          onTap: () =>
              context.read<RemoveSongCubit>().removeSong(playlistID, song.id),
          child: const Text("Remove from this playlist"),
        ),
      PopupSubMenuItem(
        items: context.read<PlaylistListCubit>().state.maybeWhen(
              orElse: () => [],
              loadSuccess: (playlists) => playlists,
            ),
        onSelected: (value) =>
            context.read<AddSongCubit>().addSong(value.id, song.id),
        title: "Add to playlist",
      ),
      const PopupMenuDivider(),
      PopupMenuItem(
        onTap: () => Clipboard.setData(
          ClipboardData(text: song.url),
        ),
        child: const Text("Share"),
      ),
    ],
    position: RelativeRect.fromRect(
      offset & const Size(40, 40),
      Offset.zero & overlay.semanticBounds.size,
    ),
  );
}
