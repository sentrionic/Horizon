import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/injection.dart';
import 'package:just_audio/just_audio.dart';

class TrackInfo extends StatelessWidget {
  const TrackInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ToggleLikeCubit>(),
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        buildWhen: (p, c) => p.player != c.player,
        builder: (context, state) {
          final player = state.player;
          return StreamBuilder<SequenceState?>(
            stream: player.sequenceStateStream,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state == null) return const SizedBox();
              final sequence = state.sequence;
              final song = sequence[state.currentIndex].tag as Song;
              return Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60,
                    color: Colors.black26,
                    child: const Icon(Icons.music_note_sharp),
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        song.artist.username,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.grey[300], fontSize: 11.0),
                      )
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  IconButton(
                    icon: Icon(
                      song.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: song.isLiked
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                      size: 20,
                    ),
                    onPressed: () =>
                        context.read<ToggleLikeCubit>().toggleLike(song.id),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
