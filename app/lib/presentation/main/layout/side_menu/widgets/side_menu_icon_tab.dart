import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const SideMenuIconTab({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        dense: true,
        tileColor: isActive ? Colors.grey.withAlpha(60) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: Icon(
          iconData,
          color: isActive ? Colors.white : Colors.white70,
          size: 28.0,
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: isActive ? Colors.white : Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}

class FavoriteSongsTab extends StatelessWidget {
  const FavoriteSongsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActive =
        AutoRouter.of(context).current.name == LikedSongsScreenRoute.name;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.only(left: 18),
        leading: Container(
          width: 25,
          height: 25,
          color: Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.favorite,
            color: isActive ? Colors.white : Colors.white70,
            size: 14.0,
          ),
        ),
        title: Text(
          "Liked Songs",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: isActive ? Colors.white : Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          AutoRouter.of(context).push(const LikedSongsScreenRoute());
        },
      ),
    );
  }
}
