import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/delete_playlist/delete_playlist_cubit.dart';
import 'package:horizon/domain/playlists/playlist.dart';

class DeletePlaylistDialog extends StatelessWidget {
  final Playlist playlist;
  const DeletePlaylistDialog({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Delete ${playlist.name}?",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      content: const Text(
        "This action cannot be undone.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.router.pop(),
          child: const Text(
            "CANCEL",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8,
          ),
          child: ElevatedButton(
            onPressed: () =>
                context.read<DeletePlaylistCubit>().deletePlaylist(playlist.id),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.all(20),
              shape: const StadiumBorder(),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text(
              "DELETE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
