enum TripStatus { active, inactive, unknown }

extension TripStatusParser on TripStatus {
  static TripStatus fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'active':
        return TripStatus.active;
      case 'inactive':
        return TripStatus.inactive;
      default:
        return TripStatus.unknown;
    }
  }

  // En Name
  String get enName {
    switch (this) {
      case TripStatus.active:
        return 'Active';
      case TripStatus.inactive:
        return 'Inactive';
      default:
        return 'Unknown';
    }
  }

  // Ar Name
  String get arName {
    switch (this) {
      case TripStatus.active:
        return 'مفعلة';
      case TripStatus.inactive:
        return 'غير مفعلة';
      default:
        return 'غير معروف';
    }
  }
}
