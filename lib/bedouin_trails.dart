import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/functions/on_generate_route.dart';
import 'core/services/hive_services.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/constants.dart';
import 'core/utils/size_config.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/dashboard/dashboard_view.dart';
import 'generated/l10n.dart';

class BedouinTrails extends StatelessWidget {
  const BedouinTrails({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isLoggedIn = HiveServices.isAdminLoggedIn();

    return MaterialApp(
      title: 'Bedouin Trails',
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        primaryColor: AppColors.sandyBrown,
        fontFamily: Constants.elMessiriFontFamily,
        scaffoldBackgroundColor: AppColors.white,
      ),
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: isLoggedIn ? DashboardView.routeName : LoginView.routeName,
    );
  }
}
