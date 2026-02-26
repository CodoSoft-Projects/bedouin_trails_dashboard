// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/account_model.dart';
import '../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../employees/presentation/manager/employees_provider.dart';
import '../../orders/presentation/manager/orders_provider.dart';
import '../../trips/presentation/manager/trips_provider.dart';
import '../../users/presentation/manager/users_provider.dart';

void getDashboardFeaturesDataWithAccountPermissions({
  required BuildContext context,
  required AccountModel account,
}) {
  /// to get dashboard features data.
  Future.microtask(() {
    if (account.isAdmin || account.permissions.manageTrips == true) {
      context.read<TripsProvider>().getAllActiveTrips();
    }
    if (account.isAdmin || account.permissions.manageSuspendedTrips == true) {
      context.read<TripsProvider>().getAllInactiveTrips();
    }
    if (account.isAdmin || account.permissions.manageUsers == true) {
      context.read<UsersProvider>().getAllUsers();
    }
    if (account.isAdmin || account.permissions.manageBookingRequests == true) {
      context.read<OrdersProvider>().getAllOrdersUsers();
    }
    if (account.isAdmin) {
      context.read<EmployeesProvider>().getAllEmployees();
      getControlPanelData(context);
    }
  });
}
