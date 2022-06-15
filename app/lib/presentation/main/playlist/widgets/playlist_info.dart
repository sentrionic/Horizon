import 'package:flutter/material.dart';

class PlayListInfo extends StatelessWidget {
  final String name;
  final String? description;
  final String info;
  final Widget child;

  const PlayListInfo({
    Key? key,
    required this.name,
    this.description,
    required this.info,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 190,
              height: 190,
              color: Colors.black87,
              child: const Icon(
                Icons.music_note_sharp,
                size: 64,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 48),
                  ),
                  const SizedBox(height: 16.0),
                  if (description != null)
                    Text(
                      description!,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  const SizedBox(height: 16.0),
                  Text(
                    info,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        child,
      ],
    );
  }
}
