import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
  String get arName {
    switch (this) {
      case DashboardType.controlPanel:
        return 'لوحة التحكم';
      case DashboardType.trips:
        return 'الرحلات السياحية';
      case DashboardType.suspendedTrips:
        return 'الرحلات الموقوفة';
      case DashboardType.users:
        return 'متابعة المستخدمين';
      case DashboardType.employees:
        return 'الموظفين';
      case DashboardType.bookingRequests:
        return 'طلبات حجز الرحلات';
      case DashboardType.siteManagement:
        return 'إدارة الموقع';
    }
  }

  String get enName {
    switch (this) {
      case DashboardType.controlPanel:
        return 'Control Panel';
      case DashboardType.trips:
        return 'Trips';
      case DashboardType.suspendedTrips:
        return 'Suspended Trips';
      case DashboardType.users:
        return 'User Monitoring';
      case DashboardType.employees:
        return 'Employees';
      case DashboardType.bookingRequests:
        return 'Booking Requests';
      case DashboardType.siteManagement:
        return 'Site Management';
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
