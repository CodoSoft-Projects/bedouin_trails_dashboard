class AboutUsModel {
  final int id;
  final String title;
  final String description;
  final String image;

  const AboutUsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  /// ------------------ FROM JSON ------------------
  factory AboutUsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AboutUsModel(id: 0, title: '', description: '', image: '');
    }

    return AboutUsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }

  /// ------------------ TO JSON ------------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  /// ------------------ LIST PARSER ------------------
  static List<AboutUsModel> listFromJson(List? list) {
    if (list == null || list.isEmpty) return [];

    return list.map((e) => AboutUsModel.fromJson(e)).toList();
  }

  static const empty = AboutUsModel(
    id: 0,
    title: '',
    description: '',
    image: '',
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AboutUsModel &&
          runtimeType == other.runtimeType &&
          other.id == id &&
          other.title == title &&
          other.description == description &&
          other.image == image;

  @override
  int get hashCode => id.hashCode;
}
