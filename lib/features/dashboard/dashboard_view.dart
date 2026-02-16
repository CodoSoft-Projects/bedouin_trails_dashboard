// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/size_config.dart';
import '../employees/presentation/manager/employees_provider.dart';
import '../profile/presentation/manager/profile_provider.dart';
import '../trips/presentation/manager/trips_provider.dart';
import 'functions/get_current_dashboard_view.dart';
import 'providers/dashboard_manager.dart';
import 'widgets/dashboard_app_bar.dart';
import 'widgets/dashboard_drawer.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});
  static const routeName = 'dashboard-view';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();

    /// to get account data
    Future.microtask(() {
      context.read<ProfileProvider>().getAccountData();
    });

    /// to get dashboard features data.
    Future.microtask(() {
      context.read<TripsProvider>()
        ..getAllActiveTrips()
        ..getAllInactiveTrips();
      context.read<EmployeesProvider>().getAllEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardViewManager();
  }
}

class DashboardViewManager extends StatelessWidget {
  const DashboardViewManager({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardManager(),
      child: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return Scaffold(
            key: context.watch<DashboardManager>().scaffoldKey,
            drawer: DashboardDrawer(),
            body: DashboardViewBody(),
          );
        },
      ),
    );
  }
}

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
