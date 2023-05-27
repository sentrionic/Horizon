import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/presentation/common/utils/time_utils.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class SeekBar extends HookWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChangeEnd;

  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final dragValue = useState<double?>(null);
    return SliderTheme(
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
        width: double.infinity,
        height: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: Text(
                getDurationString(position.inSeconds),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Positioned.fill(
              left: 15,
              right: 15,
              child: Slider(
                max: duration.inMilliseconds.toDouble(),
                value: min(
                  dragValue.value ?? position.inMilliseconds.toDouble(),
                  duration.inMilliseconds.toDouble(),
                ),
                onChanged: (value) {
                  dragValue.value = value;
                },
                onChangeEnd: (value) {
                  onChangeEnd(Duration(milliseconds: value.round()));
                  dragValue.value = null;
                },
              ),
            ),
            Positioned(
              right: 0,
              child: Text(
                getDurationString(duration.inSeconds),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration duration;

  PositionData(this.position, this.duration);
}
