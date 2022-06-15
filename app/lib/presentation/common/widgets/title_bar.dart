import 'package:flutter/material.dart';
import 'package:horizon/presentation/common/utils/setup_hive.dart';
import 'package:horizon/presentation/common/utils/utils.dart';
import 'package:horizon/presentation/common/widgets/widget_sizes.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Future<void> onWindowResize() async {
    final size = await windowManager.getSize();
    storeWindowSize(size);
  }

  @override
  Widget build(BuildContext context) {
    return DragToMoveArea(
      child: SizedBox(
        width: double.infinity,
        height: titleBarHeight,
        child: Row(
          children: [
            Container(
              width: sideMenuWidth,
              color: Colors.black,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),
            Container(
              width: 140,
              color: Colors.black,
              child: isDesktop()
                  ? Row(
                      children: [
                        WindowCaptionButton.minimize(
                          brightness: Brightness.dark,
                          onPressed: () => windowManager.minimize(),
                        ),
                        WindowCaptionButton.maximize(
                          brightness: Brightness.dark,
                          onPressed: () async {
                            if (await windowManager.isMaximized()) {
                              windowManager.unmaximize();
                            } else {
                              windowManager.maximize();
                            }
                          },
                        ),
                        WindowCaptionButton.close(
                          brightness: Brightness.dark,
                          onPressed: () => windowManager.close(),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
