import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:just_audio/just_audio.dart';

class ArtistHeader extends StatelessWidget {
  final Artist artist;
  const ArtistHeader({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(artist.image),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artist.username,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 80),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 50.0),
        Row(
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
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            context
                                .read<AudioPlayerCubit>()
                                .state
                                .player
                                .pause();
                          } else {
                            final index = state.currentlyPlayingID == artist.id
                                ? state.player.currentIndex
                                : 0;
                            context.read<SongListCubit>().state.maybeWhen(
                                  orElse: () {},
                                  loadSuccess: (songs) {
                                    context
                                        .read<AudioPlayerCubit>()
                                        .setAudioAndPlay(
                                          songs,
                                          index!,
                                          artist.id,
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
        ),
      ],
    );
  }
}
