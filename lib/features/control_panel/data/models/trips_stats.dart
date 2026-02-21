class TripsStats {
  final int totalActive;
  final int totalInactive;

  const TripsStats({
    required this.totalActive,
    required this.totalInactive,
  });

  factory TripsStats.fromJson(Map<String, dynamic>? json) {
    if (json == null) return TripsStats.empty();

    return TripsStats(
      totalActive: json['totalActive'] ?? 0,
      totalInactive: json['totalInactive'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalActive': totalActive,
      'totalInactive': totalInactive,
    };
  }

  factory TripsStats.empty() {
    return const TripsStats(totalActive: 0, totalInactive: 0);
  }
}