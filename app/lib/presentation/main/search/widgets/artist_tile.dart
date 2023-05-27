import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/domain/artist/artist.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class ArtistTile extends StatelessWidget {
  final Artist artist;
  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        ArtistRoute(id: artist.id),
      ),
      child: Card(
        color: ThemeColors.artistCard,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black38,
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: NetworkImage(artist.image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                artist.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Artist",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
