class SettingsItemModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String? metaTitle;
  final String? metaDescription;

  const SettingsItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    this.metaTitle,
    this.metaDescription,
  });

  /// ------------------ FROM JSON ------------------
  factory SettingsItemModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const SettingsItemModel(
        id: 0,
        title: '',
        description: '',
        image: '',
        metaTitle: null,
        metaDescription: null,
      );
    }

    return SettingsItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
    );
  }

  /// ------------------ TO JSON ------------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'meta_title': metaTitle,
      'meta_description': metaDescription,
    };
  }

  /// ------------------ LIST PARSER ------------------
  static List<SettingsItemModel> listFromJson(List? list) {
    if (list == null || list.isEmpty) return [];

    return list.map((e) => SettingsItemModel.fromJson(e)).toList();
  }

  static const empty = SettingsItemModel(
    id: 0,
    title: '',
    description: '',
    image: '',
    metaTitle: null,
    metaDescription: null,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsItemModel &&
          runtimeType == other.runtimeType &&
          other.id == id &&
          other.title == title &&
          other.description == description &&
          other.image == image &&
          other.metaTitle == metaTitle &&
          other.metaDescription == metaDescription;

  @override
  int get hashCode => id.hashCode;
}
