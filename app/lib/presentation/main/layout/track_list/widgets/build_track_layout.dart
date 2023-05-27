import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/songs/toggle_like/toggle_like_cubit.dart';
import 'package:horizon/domain/songs/song.dart';
import 'package:horizon/presentation/common/utils/time_utils.dart';
import 'package:horizon/presentation/main/layout/track_list/widgets/custom_data_table.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

const dateAddedWidth = 1000;

List<CustomDataColumn> buildColumns(
  BuildContext context, {
  required bool showHeader,
  required bool isDateAdded,
}) {
  const style = TextStyle(color: Colors.grey);
  if (!showHeader) {
    return [
      const CustomDataColumn(
        label: SizedBox(),
        size: ColumnSize.L,
      ),
      const CustomDataColumn(label: SizedBox()),
      if (MediaQuery.of(context).size.width > dateAddedWidth)
        const CustomDataColumn(label: SizedBox()),
      const CustomDataColumn(label: SizedBox()),
    ];
  } else {
    return [
      const CustomDataColumn(
        label: Text(
          '#    TITLE',
          style: style,
        ),
        size: ColumnSize.L,
      ),
      const CustomDataColumn(
        label: Text(
          'ARTIST',
          style: style,
        ),
      ),
      if (MediaQuery.of(context).size.width > dateAddedWidth)
        CustomDataColumn(
          label: Text(
            isDateAdded ? 'DATE ADDED' : "PLAYS",
            style: style,
          ),
          size: ColumnSize.S,
          numeric: !isDateAdded,
        ),
      CustomDataColumn(
        label: Row(
          children: const [
            SizedBox(
              width: 60,
            ),
            Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
          ],
        ),
        size: ColumnSize.S,
      ),
    ];
  }
}

List<DataCell> buildCells({
  required BuildContext context,
  required Song song,
  required int index,
  required bool selected,
}) {
  const albumSize = 40.0;
  const spacer = 25.0;
  final textStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: selected ? Theme.of(context).colorScheme.secondary : Colors.grey,
  );
  return [
    DataCell(
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Text(
              "${index + 1}",
              style: textStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            left: spacer,
            child: Container(
              width: albumSize,
              height: albumSize,
              color: Colors.black87,
              child: const Icon(
                Icons.music_note_sharp,
              ),
            ),
          ),
          Positioned(
            left: albumSize + 1.5 * spacer,
            child: Text(
              song.title,
              style: textStyle.copyWith(
                color: selected
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
    DataCell(
      GestureDetector(
        onTap: () => context.router.push(
          ArtistRoute(id: song.artist.id),
        ),
        child: Text(
          song.artist.username,
          style: textStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
    if (MediaQuery.of(context).size.width > dateAddedWidth)
      DataCell(
        Padding(
          padding: song.dateAdded == null
              ? const EdgeInsets.symmetric(horizontal: 15.0)
              : EdgeInsets.zero,
          child: Text(
            song.dateAdded != null
                ? getDateAdded(song.dateAdded!)
                : song.plays.toString(),
            style: textStyle,
          ),
        ),
      ),
    DataCell(
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () =>
                  context.read<ToggleLikeCubit>().toggleLike(song.id),
              icon: Icon(
                song.isLiked ? Icons.favorite : Icons.favorite_border,
                color: song.isLiked
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
              ),
            ),
          ),
          Positioned(
            left: 50,
            child: Text(
              getDurationString(song.duration),
              style: textStyle,
            ),
          ),
        ],
      ),
    ),
  ];
}
