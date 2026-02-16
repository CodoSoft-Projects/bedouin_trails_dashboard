import 'trip_card_model.dart';

class TripDayModel {
  final int id;
  final int dayNumber;
  final List<TripCardModel> cards;

  const TripDayModel({
    required this.id,
    required this.dayNumber,
    required this.cards,
  });

  factory TripDayModel.fromJson(Map<String, dynamic>? json) {
    final cardsJson = (json?['cards'] as List?) ?? [];

    return TripDayModel(
      id: json?['id'] ?? 0,
      dayNumber: json?['day_number'] ?? 0,
      cards: cardsJson.map((e) => TripCardModel.fromJson(e)).toList(),
    );
  }
  // to string
  @override
  String toString() {
    return 'TripDayModel{id: $id, dayNumber: $dayNumber, cards: $cards}';
  }
}
