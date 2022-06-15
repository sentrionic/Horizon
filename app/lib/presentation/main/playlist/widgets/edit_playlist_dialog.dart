import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/playlists/edit_playlist/edit_playlist_cubit.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class EditPlaylistDialog extends StatelessWidget {
  final String id;
  const EditPlaylistDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeColors.dialogBackground,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Edit details"),
          IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: BlocBuilder<EditPlaylistCubit, EditPlaylistState>(
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Row(
              children: [
                Container(
                  color: Colors.black12,
                  width: 150,
                  height: 150,
                  child: const Icon(
                    Icons.music_note_sharp,
                    size: 64,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        initialValue: state.name.getOrCrash(),
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Add a name",
                          label: Text("Name"),
                          fillColor: ThemeColors.dialogInput,
                          labelStyle: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(),
                          filled: true,
                          errorStyle: TextStyle(
                            color: ThemeColors.errorRed,
                          ),
                        ),
                        style: const TextStyle(fontSize: 13),
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => context
                            .read<EditPlaylistCubit>()
                            .nameChanged(value),
                        validator: (_) => context
                            .read<EditPlaylistCubit>()
                            .state
                            .name
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                invalidInput: (_) => 'Invalid Input',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        initialValue: state.description.getOrCrash(),
                        decoration: const InputDecoration(
                          hintText: "Add an optional description",
                          label: Text("Description"),
                          fillColor: ThemeColors.dialogInput,
                          labelStyle: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(),
                          filled: true,
                          errorStyle: TextStyle(
                            color: ThemeColors.errorRed,
                          ),
                        ),
                        minLines: 4,
                        maxLines: null,
                        style: const TextStyle(fontSize: 13),
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => context
                            .read<EditPlaylistCubit>()
                            .descriptionChanged(value),
                        validator: (_) => context
                            .read<EditPlaylistCubit>()
                            .state
                            .description
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                invalidInput: (_) => 'Invalid Input',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8,
          ),
          child: ElevatedButton(
            onPressed: () => context.read<EditPlaylistCubit>().editPlaylist(id),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              shape: const StadiumBorder(),
              primary: Colors.white,
            ),
            child: const Text(
              "SAVE",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
