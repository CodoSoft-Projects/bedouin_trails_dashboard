import 'trip_model.dart';

class TripsResponseModel {
  final bool status;
  final String message;
  final List<TripModel> trips;

  const TripsResponseModel({
    required this.status,
    required this.message,
    required this.trips,
  });

  factory TripsResponseModel.fromJson(Map<String, dynamic>? json) {
    /// data might be null OR not a list
    final dataList = (json?['data'] as List?) ?? [];

    return TripsResponseModel(
      status: json?['status'] ?? false,
      message: json?['message'] ?? '',
      trips: dataList
          .map((e) => TripModel.fromJson(e))
          .toList(),
    );
  }
}
