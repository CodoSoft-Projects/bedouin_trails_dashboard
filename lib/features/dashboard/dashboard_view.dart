import 'package:flutter/material.dart';

import '../../core/utils/size_config.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = 'dashboard-view';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Center();
  }
}
