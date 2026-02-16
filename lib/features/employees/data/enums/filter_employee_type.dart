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
  Map<String, dynamic> get key {
    switch (this) {
      case FilterEmployeeType.active:
        return {"status": 1};
      case FilterEmployeeType.inactive:
        return {"status": 0};
      case FilterEmployeeType.manageTrips:
        return {'manage_trips': true};
      case FilterEmployeeType.manageSuspendedTrips:
        return {'manage_suspended_trips': true};
      case FilterEmployeeType.manageUsers:
        return {'manage_users': true};
      case FilterEmployeeType.manageBookingRequests:
        return {'booking_requests': true};
      case FilterEmployeeType.manageWebsite:
        return {'manage_website': true};
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
