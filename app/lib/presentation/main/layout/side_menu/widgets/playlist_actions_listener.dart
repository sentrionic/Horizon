import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/create_playlist/create_playlist_cubit.dart';
import 'package:horizon/application/playlists/delete_playlist/delete_playlist_cubit.dart';
import 'package:horizon/application/playlists/edit_playlist/edit_playlist_cubit.dart';
import 'package:horizon/application/playlists/playlist_list/playlist_list_cubit.dart';
import 'package:horizon/presentation/common/utils/flushbar_creator.dart';

class PlaylistActionsListener extends StatelessWidget {
  final Widget child;
  const PlaylistActionsListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CreatePlaylistCubit, CreatePlaylistState>(
          listenWhen: (p, c) =>
              p.createFailureOrSuccessOption != c.createFailureOrSuccessOption,
          listener: (context, state) {
            state.createFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  buildErrorFlushbar(
                    message: failure.maybeMap(
                      orElse: () => "Server Error. Try again later.",
                    ),
                  ).show(context);
                },
                (playlist) {
                  context.read<PlaylistListCubit>().addPlaylist(playlist);
                  AutoRouter.of(context).pop();
                },
              ),
            );
          },
        ),
        BlocListener<EditPlaylistCubit, EditPlaylistState>(
          listenWhen: (p, c) =>
              p.editFailureOrSuccessOption != c.editFailureOrSuccessOption,
          listener: (context, state) {
            state.editFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  buildErrorFlushbar(
                    message: failure.maybeMap(
                      orElse: () => "Server Error. Try again later.",
                    ),
                  ).show(context);
                },
                (playlist) {
                  context.read<PlaylistListCubit>().updatePlaylist(playlist);
                  AutoRouter.of(context).pop();
                },
              ),
            );
          },
        ),
        BlocListener<DeletePlaylistCubit, DeletePlaylistState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              deleteFailure: (state) {
                buildErrorFlushbar(
                  message: state.maybeMap(
                    orElse: () => "Server Error. Try again later.",
                  ),
                ).show(context);
              },
              deleteSuccess: (state) {
                context
                    .read<PlaylistListCubit>()
                    .removePlaylist(state.playlist);
                AutoRouter.of(context).pop();
              },
            );
          },
        ),
      ],
      child: child,
    );
  }
}
