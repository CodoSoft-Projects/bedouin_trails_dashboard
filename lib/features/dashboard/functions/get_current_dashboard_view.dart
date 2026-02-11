import 'package:flutter/material.dart';

import '../../booking_requests/presentation/views/booking_requests_view.dart';
import '../../employees/presentation/views/employees_view.dart';
import '../../trips/presentation/views/suspended_trips_view.dart';
import '../../trips/presentation/views/trips_view.dart';
import '../../users/presentation/views/users_view.dart';
import '../enum/dashboard_type.dart';

Widget getCurrentDashboardView(DashboardType view) {
  switch (view) {
    case DashboardType.controlPanel:
      return const Center(child: Text('Control Panel View'));
    case DashboardType.trips:
      return const TripsView();
    case DashboardType.suspendedTrips:
      return const SuspendedTripsView();
    case DashboardType.users:
      return const UsersView();
    case DashboardType.employees:
      return const EmployeesView();
    case DashboardType.bookingRequests:
      return const BookingRequestsView();
    case DashboardType.siteManagement:
      return const Center(child: Text('Site Management View'));
  }
}
