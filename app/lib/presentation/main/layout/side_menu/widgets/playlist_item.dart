import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:horizon/domain/playlists/playlist.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  final bool isActive;
  final Function() onSecondaryTap;
  final Function(TapDownDetails) onSecondaryTapDown;

  const PlaylistItem({
    Key? key,
    required this.playlist,
    required this.isActive,
    required this.onSecondaryTap,
    required this.onSecondaryTapDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapDown: onSecondaryTapDown,
      child: ListTile(
        dense: true,
        title: Text(
          playlist.name,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: isActive ? Colors.white : Colors.grey[300],
                fontSize: 12,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          AutoRouter.of(context).push(PlaylistScreenRoute(id: playlist.id));
        },
      ),
    );
  }
}
