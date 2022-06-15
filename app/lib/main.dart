import 'package:flutter/material.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/common/utils/setup_hive.dart';
import 'package:horizon/presentation/common/utils/utils.dart';
import 'package:horizon/presentation/core/app_widget.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.prod);

  await setupHive();

  if (isDesktop()) {
    await windowManager.ensureInitialized();

    final windowOptions = WindowOptions(
      minimumSize: const Size(850, 600),
      size: getWindowSize(),
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.center();
      await windowManager.show();
    });
  }

  // Init the cache
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(AppWidget()),
    storage: storage,
  );
}
