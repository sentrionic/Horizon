import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:horizon/presentation/main/layout/controls/widgets/more_controls_widget.dart';
import 'package:horizon/presentation/main/layout/controls/widgets/player_controls_widget.dart';
import 'package:horizon/presentation/main/layout/controls/widgets/track_info_widget.dart';

class AudioControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        return Container(
          height: 90.0,
          width: double.infinity,
          color: ThemeColors.audioControls,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Expanded(
                  child: TrackInfo(),
                ),
                Expanded(
                  child: PlayerControls(
                    player: state.player,
                  ),
                ),
                if (MediaQuery.of(context).size.width > 800)
                  const Expanded(
                    child: MoreControls(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
