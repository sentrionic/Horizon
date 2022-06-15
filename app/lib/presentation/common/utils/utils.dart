import 'dart:io';

import 'package:flutter/foundation.dart';

bool isDesktop() =>
    !kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows);
