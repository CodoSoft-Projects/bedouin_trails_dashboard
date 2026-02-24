import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../generated/l10n.dart';

enum DashboardType {
  controlPanel, // لوحة التحكم
  trips, // الرحلات السياحية
  suspendedTrips, // الرحلات الموقوفة
  users, // متابعة المستخدمين
  employees, // الموظفين
  bookingRequests, // طلبات حجز الرحلات
  siteManagement, // إدارة الموقع
}

extension DashboardTypeExtension on DashboardType {
  String label(BuildContext context) {
    switch (this) {
      case DashboardType.controlPanel:
        return S.of(context).controlPanel;
      case DashboardType.trips:
        return S.of(context).trips;
      case DashboardType.suspendedTrips:
        return S.of(context).suspendedTrips;
      case DashboardType.users:
        return S.of(context).usersManagement;
      case DashboardType.employees:
        return S.of(context).employees;
      case DashboardType.bookingRequests:
        return S.of(context).bookingRequests;
      case DashboardType.siteManagement:
        return S.of(context).siteManagement;
    }
  }

  IconData get icon {
    switch (this) {
      case DashboardType.controlPanel:
        return LucideIcons.layoutGrid;
      case DashboardType.trips:
        return LucideIcons.plane;
      case DashboardType.suspendedTrips:
        return LucideIcons.ticketX;
      case DashboardType.users:
        return LucideIcons.users;
      case DashboardType.employees:
        return LucideIcons.idCardLanyard;
      case DashboardType.bookingRequests:
        return LucideIcons.notebookText;
      case DashboardType.siteManagement:
        return LucideIcons.monitorCog;
    }
  }
}
