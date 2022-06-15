import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/audio_player/audio_player_cubit.dart';
import 'package:horizon/application/songs/increment_playcount/increment_playcount_cubit.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/presentation/main/layout/track_list/widgets/build_track_layout.dart';
import 'package:horizon/presentation/main/layout/track_list/widgets/custom_data_table.dart';
import 'package:horizon/presentation/main/layout/track_list/widgets/track_context_menu.dart';
import 'package:just_audio/just_audio.dart';

class TracksList extends HookWidget {
  final List<Song> songs;
  final String currentID;
  final bool isDateAdded;
  final bool showHeader;
  final String? playlistID;

  const TracksList({
    Key? key,
    required this.songs,
    required this.currentID,
    this.isDateAdded = true,
    this.showHeader = true,
    this.playlistID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = context.read<AudioPlayerCubit>().state.player;
    final _tapPosition = useState<Offset>(Offset.zero);
    return StreamBuilder<SequenceState?>(
      stream: player.sequenceStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        return Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: CustomDataTable(
            showDivider: showHeader,
            headingRowHeight: showHeader ? null : 0,
            headingTextStyle:
                Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
            dataRowHeight: 54.0,
            showCheckboxColumn: false,
            columns: buildColumns(
              context,
              showHeader: showHeader,
              isDateAdded: isDateAdded,
            ),
            rows: songs.mapIndexed((i, e) {
              final selected = playerState?.currentIndex == i &&
                  currentID ==
                      context
                          .watch<AudioPlayerCubit>()
                          .state
                          .currentlyPlayingID;
              return CustomDataRow(
                onSecondaryTap: () => showTrackContextMenu(
                  context,
                  _tapPosition.value,
                  e,
                  playlistID,
                ),
                onSecondaryTapDown: (value) =>
                    _tapPosition.value = value.globalPosition,
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.grey.withAlpha(60);
                  }
                  if (states.contains(MaterialState.selected)) {
                    return Colors.transparent;
                  }
                  return null;
                }),
                cells: buildCells(
                  context: context,
                  song: e,
                  index: i,
                  selected: selected,
                ),
                selected: selected,
                onSelectChanged: (_) async {
                  await context
                      .read<AudioPlayerCubit>()
                      .setAudioAndPlay(songs, i, currentID)
                      .then((_) {
                    context
                        .read<IncrementPlaycountCubit>()
                        .incrementPlayCount(songs[i].id);
                  });
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
