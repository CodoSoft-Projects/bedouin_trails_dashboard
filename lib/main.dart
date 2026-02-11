import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bedouin_trails.dart';
import 'core/functions/open_hive_boxes.dart';
import 'core/services/service_locator.dart';
import 'core/utils/k_platform.dart';
import 'features/profile/presentation/manager/profile_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Get It
  setupServicesLocator();
  // Open Hive Boxes
  await openHiveBoxes();

  runApp(
    MultiProvider(
      providers: [
        /// Core Providers
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const BedouinTrails(),
    ),
  );

  if (KPlatform.isDesktop) {
    doWhenWindowReady(() {
      appWindow.minSize = Size(600, 650);
      appWindow.alignment = Alignment.center;
      appWindow.show();
      // appWindow.maximize();
    });
  }
}
