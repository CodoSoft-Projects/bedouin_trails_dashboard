class PermissionsModel {
  final bool manageTrips;
  final bool manageSuspendedTrips;
  final bool manageUsers;
  final bool manageBookingRequests;
  final bool manageWebsite;

  const PermissionsModel({
    required this.manageTrips,
    required this.manageSuspendedTrips,
    required this.manageUsers,
    required this.manageBookingRequests,
    required this.manageWebsite,
  });

  /// ================= FROM JSON =================
  factory PermissionsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PermissionsModel.empty();

    return PermissionsModel(
      manageTrips: _asBool(json['manage_trips']),
      manageSuspendedTrips: _asBool(json['manage_suspended_trips']),
      manageUsers: _asBool(json['manage_users']),
      manageBookingRequests: _asBool(json['booking_requests']),
      manageWebsite: _asBool(json['manage_website']),
    );
  }

  /// ================= EMPTY (all false) =================
  factory PermissionsModel.empty() {
    return const PermissionsModel(
      manageTrips: false,
      manageSuspendedTrips: false,
      manageUsers: false,
      manageBookingRequests: false,
      manageWebsite: false,
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      "manage_trips": manageTrips,
      "manage_suspended_trips": manageSuspendedTrips,
      "manage_users": manageUsers,
      "booking_requests": manageBookingRequests,
      "manage_website": manageWebsite,
    };
  }

  // copy with
  PermissionsModel copyWith({
    bool? manageTrips,
    bool? manageSuspendedTrips,
    bool? manageUsers,
    bool? manageBookingRequests,
    bool? manageWebsite,
  }) {
    return PermissionsModel(
      manageTrips: manageTrips ?? this.manageTrips,
      manageSuspendedTrips: manageSuspendedTrips ?? this.manageSuspendedTrips,
      manageUsers: manageUsers ?? this.manageUsers,
      manageBookingRequests:
          manageBookingRequests ?? this.manageBookingRequests,
      manageWebsite: manageWebsite ?? this.manageWebsite,
    );
  }

  /// ================= HELPERS =================

  /// has at least one permission
  bool get hasAnyPermission =>
      manageTrips ||
      manageSuspendedTrips ||
      manageUsers ||
      manageBookingRequests ||
      manageWebsite;

  /// super admin (full access)
  bool get isSuperAdmin =>
      manageTrips &&
      manageSuspendedTrips &&
      manageUsers &&
      manageBookingRequests &&
      manageWebsite;

  /// ================= SAFE BOOL PARSER =================
  static bool _asBool(dynamic value) {
    if (value == null) return false;

    if (value is bool) return value;

    if (value is int) return value == 1;

    if (value is String) {
      final v = value.toLowerCase();
      return v == '1' || v == 'true';
    }

    return false;
  }
}
