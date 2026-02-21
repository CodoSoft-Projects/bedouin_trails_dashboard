import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/size_config.dart';
import '../functions/get_current_dashboard_view.dart';
import '../providers/dashboard_manager.dart';
import 'dashboard_app_bar.dart';
import 'dashboard_drawer.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isDesktop = SizeConfig.isDesktop();
    return SafeArea(
      child: Row(
        children: [
          if (isDesktop) DashboardDrawer(),
          Expanded(
            child: Column(
              children: [
                const DashboardAppBar(),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: getCurrentDashboardView(
                      context.watch<DashboardManager>().currentView,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
