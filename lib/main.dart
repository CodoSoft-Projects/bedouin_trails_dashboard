import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bedouin_trails.dart';
import 'core/functions/open_hive_boxes.dart';
import 'core/providers/language_provider.dart';
import 'core/services/service_locator.dart';
import 'core/utils/k_platform.dart';
import 'features/control_panel/presentation/manager/control_panel_provider.dart';
import 'features/employees/presentation/manager/employees_provider.dart';
import 'features/orders/presentation/manager/orders_provider.dart';
import 'features/profile/presentation/manager/profile_provider.dart';
import 'features/settings/presentation/manager/about_us_provider.dart';
import 'features/settings/presentation/manager/ads_provider.dart';
import 'features/settings/presentation/manager/articles_provider.dart';
import 'features/settings/presentation/manager/questions_provider.dart';
import 'features/trips/presentation/manager/trips_provider.dart';
import 'features/users/presentation/manager/users_provider.dart';

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
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => TripsProvider()),
        ChangeNotifierProvider(create: (_) => EmployeesProvider()),
        //* Control Panel
        ChangeNotifierProvider(create: (_) => ControlPanelProvider()),

        //* Settings Providers
        ChangeNotifierProvider(create: (_) => ArticlesProvider()),
        ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ChangeNotifierProvider(create: (_) => AboutUsProvider()),
        ChangeNotifierProvider(create: (_) => AdsProvider()),

        //* Users Providers
        ChangeNotifierProvider(create: (_) => UsersProvider()),

        //* Oreders Users Providers
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
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
