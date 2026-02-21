import 'bookings_stats.dart';
import 'employees_stats.dart';
import 'trips_stats.dart';

class ControlPanelModel {
  final int articlesCount;
  final int usersCount;
  final int todayBookings;
  final double averageRating;
  final EmployeesStats employees;
  final double revenueGrowth;
  final int cancelRate;
  final int newUsersPercentage;
  final TripsStats trips;
  final BookingsStats bookings;

  const ControlPanelModel({
    required this.articlesCount,
    required this.usersCount,
    required this.todayBookings,
    required this.averageRating,
    required this.employees,
    required this.revenueGrowth,
    required this.cancelRate,
    required this.newUsersPercentage,
    required this.trips,
    required this.bookings,
  });

  /// ================= FROM JSON =================
  factory ControlPanelModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ControlPanelModel.empty();

    return ControlPanelModel(
      articlesCount: json['articles_count'] ?? 0,
      usersCount: json['users_count'] ?? 0,
      todayBookings: json['today_bookings'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      employees: EmployeesStats.fromJson(json['employees']),
      revenueGrowth: (json['revenue_growth'] ?? 0).toDouble(),
      cancelRate: json['cancel_rate'] ?? 0,
      newUsersPercentage: json['new_users_percentage'] ?? 0,
      trips: TripsStats.fromJson(json['trips']),
      bookings: BookingsStats.fromJson(json['bookings']),
    );
  }

  /// ================= EMPTY =================
  factory ControlPanelModel.empty() {
    return ControlPanelModel(
      articlesCount: 0,
      usersCount: 0,
      todayBookings: 0,
      averageRating: 0,
      employees: EmployeesStats.empty(),
      revenueGrowth: 0,
      cancelRate: 0,
      newUsersPercentage: 0,
      trips: TripsStats.empty(),
      bookings: BookingsStats.empty(),
    );
  }
}