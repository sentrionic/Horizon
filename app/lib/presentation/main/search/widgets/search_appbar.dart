import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/artist/search_artists/search_artists_cubit.dart';
import 'package:horizon/application/songs/song_list/song_list_cubit.dart';
import 'package:horizon/presentation/common/widgets/account_button.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class SearchAppbar extends StatelessWidget with PreferredSizeWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  const SearchAppbar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.appBarColor,
      elevation: 0,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () => AutoRouter.of(context).hasEntries
                  ? AutoRouter.of(context).pop()
                  : null,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_left,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
            // const SizedBox(width: 16.0),
            // InkWell(
            //   customBorder: const CircleBorder(),
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.all(6.0),
            //     decoration: const BoxDecoration(
            //       color: Colors.black26,
            //       shape: BoxShape.circle,
            //     ),
            //     child: const Icon(Icons.chevron_right, size: 28.0),
            //   ),
            // ),
          ],
        ),
      ),
      title: SizedBox(
        width: 370,
        height: 40,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          cursorColor: ThemeColors.searchColor,
          decoration: InputDecoration(
            hintText: "Artists or songs",
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            labelStyle: const TextStyle(
              color: Colors.black12,
            ),
            hintStyle: const TextStyle(
              color: ThemeColors.searchColor,
              fontSize: 14,
            ),
            filled: true,
            errorStyle: const TextStyle(
              color: ThemeColors.errorRed,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(
                Icons.search,
                color: ThemeColors.searchColor,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                onPressed: () {
                  controller.clear();
                  context.read<SongListCubit>().reset();
                  context.read<SearchArtistsCubit>().reset();
                },
                icon: const Icon(
                  Icons.close,
                  color: ThemeColors.searchColor,
                ),
              ),
            ),
          ),
          autocorrect: false,
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            if (value.length > 2) {
              onSearch(value);
            }
          },
        ),
      ),
      actions: const [
        AccountButton(),
        SizedBox(width: 40.0),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
