class EmployeesStats {
  final int totalEmployeesActive;
  final int totalEmployeesInactive;

  const EmployeesStats({
    required this.totalEmployeesActive,
    required this.totalEmployeesInactive,
  });

  factory EmployeesStats.fromJson(Map<String, dynamic>? json) {
    if (json == null) return EmployeesStats.empty();

    return EmployeesStats(
      totalEmployeesActive: json['totalEmployeesActive'] ?? 0,
      totalEmployeesInactive: json['totalEmployeesInactive'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalEmployeesActive': totalEmployeesActive,
      'totalEmployeesInactive': totalEmployeesInactive,
    };
  }

  factory EmployeesStats.empty() {
    return const EmployeesStats(
      totalEmployeesActive: 0,
      totalEmployeesInactive: 0,
    );
  }
}