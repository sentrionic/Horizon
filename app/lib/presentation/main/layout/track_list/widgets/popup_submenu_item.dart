import 'package:flutter/material.dart';
import 'package:horizon/domain/playlists/playlist.dart';

/// An item with sub menu for using in popup menus
///
/// [title] is the text which will be displayed in the pop up
/// [items] is the list of items to populate the sub menu
/// [onSelected] is the callback to be fired if specific item is pressed
///
/// Selecting items from the submenu will automatically close the parent menu
/// Closing the sub menu by clicking outside of it, will automatically close the parent menu
class PopupSubMenuItem extends PopupMenuEntry {
  const PopupSubMenuItem({
    required this.title,
    required this.items,
    required this.onSelected,
  });

  final String title;
  final List<Playlist> items;
  final Function(Playlist) onSelected;

  @override
  double get height =>
      kMinInteractiveDimension; //Does not actually affect anything

  @override
  State createState() => _PopupSubMenuState();

  @override
  bool represents(_) => false;
}

/// The [State] for [PopupSubMenuItem] subclasses.
class _PopupSubMenuState extends State<PopupSubMenuItem> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Playlist>(
      tooltip: widget.title,
      onCanceled: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      onSelected: (Playlist value) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        widget.onSelected.call(value);
      },
      itemBuilder: (BuildContext context) {
        return widget.items
            .map(
              (item) => PopupMenuItem<Playlist>(
                value: item,
                child: Text(item.name),
              ),
            )
            .toList();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 8.0,
          top: 12.0,
          bottom: 12.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(widget.title),
            ),
            Icon(
              Icons.arrow_right,
              size: 24.0,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
