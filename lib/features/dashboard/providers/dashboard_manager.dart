import 'package:flutter/material.dart';

import '../enum/dashboard_type.dart';

class DashboardManager extends ChangeNotifier {
  final List<DashboardType> dashboardTypes = DashboardType.values;

  DashboardType currentView = DashboardType.controlPanel;

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
