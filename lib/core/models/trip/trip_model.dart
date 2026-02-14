import '../../enums/trip_status.dart';
import 'gallery_model.dart';
import 'trip_day_model.dart';

class TripModel {
  final int id;
  final String name;
  final double price;
  final String interfaceFrom;
  final String interfaceTo;
  final int duration;
  final TripStatus status;
  final double rate;
  final List<GalleryModel> galleries;
  final List<TripDayModel> trapDays;

  const TripModel({
    required this.id,
    required this.name,
    required this.price,
    required this.interfaceFrom,
    required this.interfaceTo,
    required this.duration,
    required this.status,
    required this.rate,
    required this.galleries,
    required this.trapDays,
  });

  /// Safe double parser (backend sends "5000.00" as String)
  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  factory TripModel.fromJson(Map<String, dynamic>? json) {
    final galleriesJson = (json?['galleries'] as List?) ?? [];
    final daysJson = (json?['trapDays'] as List?) ?? [];

    return TripModel(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
      price: _parseDouble(json?['price']),
      interfaceFrom: json?['interfaceFrom'] ?? '',
      interfaceTo: json?['interfaceTo'] ?? '',
      duration: json?['duration'] ?? 0,
      status: TripStatusParser.fromString(json?['status']),
      rate: _parseDouble(json?['rate']),
      galleries: galleriesJson
          .map((e) => GalleryModel.fromJson(e))
          .toList(),
      trapDays: daysJson
          .map((e) => TripDayModel.fromJson(e))
          .toList(),
    );
  }
}
