import 'package:flutter/material.dart';

import '../../control_panel/presentation/views/control_panel_view.dart';
import '../../employees/presentation/views/employees_view.dart';
import '../../orders/presentation/views/orders_view.dart';
import '../../settings/presentation/views/settings_view.dart';
import '../../trips/presentation/views/suspended_trips_view.dart';
import '../../trips/presentation/views/trips_view.dart';
import '../../users/presentation/views/users_view.dart';
import '../enum/dashboard_type.dart';
import '../widgets/no_permissions_view.dart';

Widget getCurrentDashboardView(DashboardType? view) {
  switch (view) {
    case DashboardType.controlPanel:
      return const ControlPanelView();
    case DashboardType.trips:
      return const TripsView();
    case DashboardType.suspendedTrips:
      return const SuspendedTripsView();
    case DashboardType.users:
      return const UsersView();
    case DashboardType.employees:
      return const EmployeesView();
    case DashboardType.bookingRequests:
      return const OrdersView();
    case DashboardType.siteManagement:
      return const SettingsView();
    default:
      return const NoPermissionView();
  }
}
