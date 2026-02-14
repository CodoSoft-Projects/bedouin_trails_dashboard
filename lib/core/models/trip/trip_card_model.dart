class TripCardModel {
  final int id;
  final int dayNumber;
  final String title;
  final String description;
  final String image;

  const TripCardModel({
    required this.id,
    required this.dayNumber,
    required this.title,
    required this.description,
    required this.image,
  });

  factory TripCardModel.fromJson(Map<String, dynamic>? json) {
    return TripCardModel(
      id: json?['id'] ?? 0,
      dayNumber: json?['day_number'] ?? 0,
      title: json?['title'] ?? '',
      description: json?['description'] ?? '',
      image: json?['image'] ?? '',
    );
  }
}
