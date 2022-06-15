import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/presentation/common/widgets/account_button.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class NavigationAppbar extends HookWidget with PreferredSizeWidget {
  final String title;
  final ScrollController controller;
  const NavigationAppbar({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showBar = useState(false);
    final animation =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final _colorTween =
        ColorTween(begin: Colors.transparent, end: ThemeColors.accountButton)
            .animate(animation);

    controller.addListener(() {
      if (controller.offset <= 120 && !controller.position.outOfRange) {
        showBar.value = false;
        animation.animateTo(controller.position.pixels);
      }
      if (controller.offset >= 120 && !controller.position.outOfRange) {
        showBar.value = true;
      }
    });

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: _colorTween.value,
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
          title: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: showBar.value ? 1 : 0,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          actions: const [
            AccountButton(),
            SizedBox(width: 40.0),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
