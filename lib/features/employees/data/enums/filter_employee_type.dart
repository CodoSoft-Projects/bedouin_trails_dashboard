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
        return 'status=${true}';
      case FilterEmployeeType.inactive:
        return 'status=${false}';
      case FilterEmployeeType.manageTrips:
        return 'permissions=manage_trips';
      case FilterEmployeeType.manageSuspendedTrips:
        return 'permissions=manage_suspended_trips';
      case FilterEmployeeType.manageUsers:
        return 'permissions=manage_users';
      case FilterEmployeeType.manageBookingRequests:
        return 'permissions=booking_requests';
      case FilterEmployeeType.manageWebsite:
        return 'permissions=manage_website';
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
