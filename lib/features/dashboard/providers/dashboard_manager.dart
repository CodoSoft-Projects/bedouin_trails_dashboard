import 'package:flutter/material.dart';

import '../../../core/models/account_model.dart';
import '../../../core/models/permissions_model.dart';
import '../../../core/services/hive_services.dart';
import '../enum/dashboard_type.dart';

class DashboardManager extends ChangeNotifier {
  final List<DashboardType> dashboardTypes = [
    DashboardType.controlPanel, // لوحة التحكم
    DashboardType.trips, // الرحلات السياحية
    DashboardType.suspendedTrips, // الرحلات الموقوفة
    DashboardType.users, // متابعة المستخدمين
    DashboardType.employees, // الموظفين
    DashboardType.bookingRequests, // طلبات حجز الرحلات
    DashboardType.siteManagement,
  ];

  DashboardType? currentView = DashboardType.controlPanel;

  //* Get Account data
  AccountModel? accountModel;

  void getAccountData() {
    accountModel = HiveServices.getAccountData();
    manageFeaturesVisibilty();
    notifyListeners();
  }

  void manageFeaturesVisibilty() {
    var permissions = accountModel?.permissions ?? PermissionsModel.empty();
    if (accountModel?.isAdmin != true) {
      currentView = null;
      dashboardTypes.remove(DashboardType.controlPanel);
      dashboardTypes.remove(DashboardType.employees);

      if (permissions.manageTrips != true) {
        dashboardTypes.remove(DashboardType.trips);
      }
      if (permissions.manageSuspendedTrips != true) {
        dashboardTypes.remove(DashboardType.suspendedTrips);
      }
      if (permissions.manageUsers != true) {
        dashboardTypes.remove(DashboardType.users);
      }
      if (permissions.manageBookingRequests != true) {
        dashboardTypes.remove(DashboardType.bookingRequests);
      }
      if (permissions.manageWebsite != true) {
        dashboardTypes.remove(DashboardType.siteManagement);
      }

      if (dashboardTypes.isNotEmpty){
        currentView = dashboardTypes.first;
      }
    }
  }

  // Scaffold Key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //* Open Drawer
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    notifyListeners();
  }

  //* Close Drawer
  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
    notifyListeners();
  }

  void changeView(DashboardType view) {
    currentView = view;
    closeDrawer();
    notifyListeners();
  }
}
