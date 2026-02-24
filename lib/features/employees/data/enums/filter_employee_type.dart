import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

enum FilterEmployeeType {
  active,
  inactive,
  //* permisssions
  manageTrips,
  manageSuspendedTrips,
  manageUsers,
  manageBookingRequests,
  manageWebsite,
}

// extension for retun json key => val
extension FilterEmployeeTypeExtension on FilterEmployeeType {
  String get key {
    switch (this) {
      case FilterEmployeeType.active:
        return 'status=${1}';
      case FilterEmployeeType.inactive:
        return 'status=${0}';
      case FilterEmployeeType.manageTrips:
        return 'permission=manage_trips';
      case FilterEmployeeType.manageSuspendedTrips:
        return 'permission=manage_suspended_trips';
      case FilterEmployeeType.manageUsers:
        return 'permission=manage_users';
      case FilterEmployeeType.manageBookingRequests:
        return 'permission=booking_requests';
      case FilterEmployeeType.manageWebsite:
        return 'permission=manage_website';
    }
  }

  String label(BuildContext context) {
    switch (this) {
      case FilterEmployeeType.active:
        return S.of(context).activeAccounts;

      case FilterEmployeeType.inactive:
        return S.of(context).inactiveAccounts;

      case FilterEmployeeType.manageTrips:
        return S.of(context).manageTrips;

      case FilterEmployeeType.manageSuspendedTrips:
        return S.of(context).manageSuspendedTrips;

      case FilterEmployeeType.manageUsers:
        return S.of(context).manageUsers;

      case FilterEmployeeType.manageBookingRequests:
        return S.of(context).manageBookingRequests;

      case FilterEmployeeType.manageWebsite:
        return S.of(context).manageWebsite;
    }
  }
}
