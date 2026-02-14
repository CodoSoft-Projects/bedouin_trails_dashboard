import 'trip_model.dart';

class TripResponseModel {
  final bool status;
  final String message;
  final TripModel trip;

  const TripResponseModel({
    required this.status,
    required this.message,
    required this.trip,
  });

  factory TripResponseModel.fromJson(Map<String, dynamic>? json) {
    return TripResponseModel(
      status: json?['status'] ?? false,
      message: json?['message'] ?? '',
      trip: TripModel.fromJson(json?['data'] ?? {}),
    );
  }
}
