import 'package:flutter/material.dart';
import 'package:horizon/presentation/main/layout/controls/widgets/seek_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayerControls extends StatelessWidget {
  final AudioPlayer player;
  const PlayerControls({
    Key? key,
    required this.player,
  }) : super(key: key);

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest2<Duration, Duration?, PositionData>(
        player.positionStream,
        player.durationStream,
        (position, duration) =>
            PositionData(position, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return player.audioSource != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<bool>(
                    stream: player.shuffleModeEnabledStream,
                    builder: (context, snapshot) {
                      final isEnabled = snapshot.data ?? false;
                      return IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.shuffle,
                          color: isEnabled
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white70,
                        ),
                        iconSize: 20.0,
                        onPressed: () async {
                          if (!isEnabled) {
                            await player.shuffle();
                          }
                          await player.setShuffleModeEnabled(!isEnabled);
                        },
                      );
                    },
                  ),
                  StreamBuilder<SequenceState?>(
                    stream: player.sequenceStateStream,
                    builder: (_, __) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.skip_previous,
                          color: Colors.white70,
                        ),
                        iconSize: 28.0,
                        onPressed: () =>
                            player.hasPrevious ? player.seekToPrevious() : null,
                      );
                    },
                  ),
                  StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) => _PlayButton(
                      player: player,
                      playerState: snapshot.data,
                    ),
                  ),
                  StreamBuilder<SequenceState?>(
                    stream: player.sequenceStateStream,
                    builder: (_, __) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.skip_next,
                          color: Colors.white70,
                        ),
                        iconSize: 28.0,
                        onPressed: () =>
                            player.hasNext ? player.seekToNext() : null,
                      );
                    },
                  ),
                  StreamBuilder<LoopMode>(
                    stream: player.loopModeStream,
                    builder: (context, snapshot) {
                      final mode = snapshot.data ?? LoopMode.off;
                      return _LoopButton(
                        mode: mode,
                        player: player,
                      );
                    },
                  ),
                ],
              ),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    onChangeEnd: player.seek,
                  );
                },
              ),
            ],
          )
        : const SizedBox();
  }
}

class _PlayButton extends StatelessWidget {
  final PlayerState? playerState;
  final AudioPlayer player;

  const _PlayButton({
    Key? key,
    required this.playerState,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = playerState?.processingState;
    if (state == null ||
        state == ProcessingState.loading ||
        state == ProcessingState.buffering) {
      return const SizedBox(
        width: 40,
        height: 40,
      );
    } else if (!player.playing) {
      return IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.play_circle),
        iconSize: 40.0,
        onPressed: () => player.play(),
      );
    } else {
      return IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.pause_circle),
        iconSize: 40.0,
        onPressed: () => player.pause(),
      );
    }
  }
}

class _LoopButton extends StatelessWidget {
  final LoopMode mode;
  final AudioPlayer player;
  const _LoopButton({
    Key? key,
    required this.mode,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      const Icon(
        Icons.repeat,
        color: Colors.white70,
      ),
      Icon(
        Icons.repeat,
        color: Theme.of(context).colorScheme.secondary,
      ),
      Icon(
        Icons.repeat_one,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(mode);
    return IconButton(
      padding: EdgeInsets.zero,
      icon: icons[index],
      iconSize: 20.0,
      onPressed: () {
        player.setLoopMode(
          cycleModes[(cycleModes.indexOf(mode) + 1) % cycleModes.length],
        );
      },
    );
  }
}
