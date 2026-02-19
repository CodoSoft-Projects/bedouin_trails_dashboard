// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/size_config.dart';
import '../employees/presentation/manager/employees_provider.dart';
import '../orders/presentation/manager/orders_provider.dart';
import '../profile/presentation/manager/profile_provider.dart';
import '../trips/presentation/manager/trips_provider.dart';
import '../users/presentation/manager/users_provider.dart';
import 'providers/dashboard_manager.dart';
import 'widgets/dashboard_drawer.dart';
import 'widgets/dashboard_view_body.dart';

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
      //* Users Providers
      context.read<UsersProvider>().getAllUsers();
      context.read<OrdesProvider>().getAllOrdersUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardManager(),
      child: const DashboardViewManager(),
    );
  }
}

class DashboardViewManager extends StatefulWidget {
  const DashboardViewManager({super.key});

  @override
  State<DashboardViewManager> createState() => _DashboardViewManagerState();
}

class _DashboardViewManagerState extends State<DashboardViewManager> {
  @override
  void initState() {
    super.initState();

    //* To manage features visibility based on permissions
    Future.microtask(() {
      SizeConfig.init(context);
      context.read<DashboardManager>().getAccountData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.watch<DashboardManager>().scaffoldKey,
      drawer: const DashboardDrawer(),
      body: const DashboardViewBody(),
    );
  }
}
