import 'dart:io';

import 'package:flutter/foundation.dart';

class KPlatform {
  const KPlatform._(); // private constructor

  static bool get isWeb => kIsWeb;

  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
}
