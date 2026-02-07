import 'package:flutter/material.dart';

import '../../trips/presentation/views/trips_view.dart';
import '../enum/dashboard_type.dart';

Widget getCurrentDashboardView(DashboardType view) {
  switch (view) {
    case DashboardType.controlPanel:
      return const Center(child: Text('Control Panel View'));
    case DashboardType.trips:
      return const TripsView();
    case DashboardType.suspendedTrips:
      return const Center(child: Text('Suspended Trips View'));
    case DashboardType.users:
      return const Center(child: Text('Users Monitoring View'));
    case DashboardType.employees:
      return const Center(child: Text('Employees View'));
    case DashboardType.bookingRequests:
      return const Center(child: Text('Booking Requests View'));
    case DashboardType.siteManagement:
      return const Center(child: Text('Site Management View'));
  }
}
