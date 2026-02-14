import '../pagination_model.dart';
import 'trip_model.dart';

class TripsResponseModel {
  final bool status;
  final String message;
  final List<TripModel> trips;
  final PaginationModel pagination;

  const TripsResponseModel({
    required this.status,
    required this.message,
    required this.trips,
    required this.pagination,
  });

  factory TripsResponseModel.fromJson(Map<String, dynamic>? json) {
    final dataList = (json?['data'] as List?) ?? [];

    return TripsResponseModel(
      status: json?['status'] ?? false,
      message: json?['message'] ?? '',
      trips: dataList.map((e) => TripModel.fromJson(e)).toList(),
      pagination: PaginationModel.fromJson(json?['pagination']),
    );
  }
}
