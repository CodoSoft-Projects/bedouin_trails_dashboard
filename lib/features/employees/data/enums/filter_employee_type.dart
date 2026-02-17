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

  String get arName {
    switch (this) {
      case FilterEmployeeType.active:
        return 'الحسابات المفعلة';
      case FilterEmployeeType.inactive:
        return 'الحسابات المعطلة';
      case FilterEmployeeType.manageTrips:
        return 'ادارة الرحلات السياحية';
      case FilterEmployeeType.manageSuspendedTrips:
        return 'ادارة الرحلات الموقوفة';
      case FilterEmployeeType.manageUsers:
        return 'ادارة المستخدمين';
      case FilterEmployeeType.manageBookingRequests:
        return 'ادارة طلبات الحجز';
      case FilterEmployeeType.manageWebsite:
        return 'ادارة الموقع';
    }
  }

  String get enName {
    switch (this) {
      case FilterEmployeeType.active:
        return 'Active Accounts';
      case FilterEmployeeType.inactive:
        return 'Inactive Accounts';
      case FilterEmployeeType.manageTrips:
        return 'Manage Trips';
      case FilterEmployeeType.manageSuspendedTrips:
        return 'Manage Suspended Trips';
      case FilterEmployeeType.manageUsers:
        return 'Manage Users';
      case FilterEmployeeType.manageBookingRequests:
        return 'Manage Booking Requests';
      case FilterEmployeeType.manageWebsite:
        return 'Manage Website';
    }
  }
}
