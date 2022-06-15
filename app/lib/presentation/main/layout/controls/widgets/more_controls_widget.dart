import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/presentation/common/utils/utils.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:just_audio/just_audio.dart';
import 'package:window_manager/window_manager.dart';

class MoreControls extends StatelessWidget {
  const MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      buildWhen: (p, c) => p.player != c.player,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _VolumeSlider(
              player: state.player,
            ),
            if (isDesktop())
              IconButton(
                icon: const Icon(
                  Icons.fullscreen_outlined,
                  color: Colors.white70,
                ),
                onPressed: () async {
                  final value = await windowManager.isFullScreen();
                  windowManager.setFullScreen(!value);
                },
              ),
          ],
        );
      },
    );
  }
}

class _VolumeSlider extends StatelessWidget {
  final AudioPlayer player;
  const _VolumeSlider({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: player.volumeStream,
      builder: (context, snapshot) {
        final volume = snapshot.data ?? 0.0;
        return Row(
          children: [
            IconButton(
              icon: Icon(
                player.volume == 0
                    ? Icons.volume_off_outlined
                    : Icons.volume_up_outlined,
                color: Colors.white70,
              ),
              onPressed: () {
                if (volume == 0) {
                  player.setVolume(
                    context.read<AudioPlayerCubit>().state.volume,
                  );
                } else {
                  player.setVolume(0);
                }
              },
            ),
            SliderTheme(
              data: const SliderThemeData().copyWith(
                trackHeight: 3,
                activeTrackColor: Theme.of(context).colorScheme.secondary,
                inactiveTrackColor: ThemeColors.inactiveTrackColor,
                overlayColor: Colors.transparent,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                  pressedElevation: 0,
                  elevation: 0,
                  enabledThumbRadius: 6,
                ),
              ),
              child: SizedBox(
                width: 150,
                child: Slider.adaptive(
                  value: volume,
                  onChanged: (value) async =>
                      context.read<AudioPlayerCubit>().setVolume(value),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
