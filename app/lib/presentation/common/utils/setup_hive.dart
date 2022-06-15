import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxes {
  static const desktopSettings = "desktop-settings";
  static const windowDimensions = "window-dimensions";
}

Future<void> setupHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(HiveBoxes.desktopSettings);
}

Size getWindowSize() {
  final json =
      Hive.box(HiveBoxes.desktopSettings).get(HiveBoxes.windowDimensions);

  if (json == null) {
    return const Size(1280.0, 720.0);
  }

  return Size(json["width"], json["height"]);
}

void storeWindowSize(Size size) {
  final box = Hive.box(HiveBoxes.desktopSettings);
  box.put(HiveBoxes.windowDimensions, {
    "width": size.width,
    "height": size.height,
  });
}
