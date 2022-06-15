import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/application/playlists/playlist_songs/playlist_songs_cubit.dart';
import 'package:horizon/presentation/common/utils/time_utils.dart';
import 'package:horizon/presentation/main/playlist/widgets/playlist_info.dart';
import 'package:just_audio/just_audio.dart';

class PlaylistHeader extends HookWidget {
  final String id;
  const PlaylistHeader({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlist = context.read<PlaylistListCubit>().getPlaylist(id);

    if (playlist == null) return const SizedBox();

    return PlayListInfo(
      name: playlist.name,
      description: playlist.description,
      info:
          '${playlist.owner} • ${playlist.songCount} songs, ${getPlaylistDuration(playlist.duration)}',
      child: _PlaylistButtons(id: id),
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String id;
  const _PlaylistButtons({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
          builder: (context, state) {
            return StreamBuilder<PlayerState>(
              stream: state.player.playerStateStream,
              builder: (context, snapshot) {
                final isPlaying = snapshot.data?.playing ?? false;
                return CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: IconButton(
                    color: Colors.black,
                    iconSize: 36.0,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      if (isPlaying) {
                        context.read<AudioPlayerCubit>().state.player.pause();
                      } else {
                        final index = state.currentlyPlayingID == id
                            ? state.player.currentIndex
                            : 0;
                        context.read<PlaylistSongsCubit>().state.maybeWhen(
                              orElse: () {},
                              loadSuccess: (songs) {
                                context
                                    .read<AudioPlayerCubit>()
                                    .setAudioAndPlay(
                                      songs,
                                      index!,
                                      id,
                                      reset: false,
                                    );
                              },
                            );
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
