import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/songs/liked_songs/liked_songs_cubit.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/domain/core/app_constants.dart';
import 'package:horizon/presentation/main/playlist/widgets/playlist_info.dart';
import 'package:just_audio/just_audio.dart';

class LikedSongsHeader extends StatelessWidget {
  final int songCount;
  const LikedSongsHeader({
    super.key,
    required this.songCount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, Account>(
      builder: (context, state) => PlayListInfo(
        name: "LIKED SONGS",
        info: '${state.username.getOrCrash()} • $songCount songs',
        child: const _LikedSongsButtons(),
      ),
    );
  }
}

class _LikedSongsButtons extends StatelessWidget {
  const _LikedSongsButtons();

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
                        final index = state.currentlyPlayingID ==
                                AppConstants.likedPlaylist
                            ? state.player.currentIndex
                            : 0;
                        context.read<LikedSongsCubit>().state.maybeWhen(
                              orElse: () {},
                              loadSuccess: (songs) {
                                context
                                    .read<AudioPlayerCubit>()
                                    .setAudioAndPlay(
                                      songs,
                                      index!,
                                      AppConstants.likedPlaylist,
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
