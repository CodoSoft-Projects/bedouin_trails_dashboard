class ArticleModel {
  final int id;
  final String title;
  final String description;
  final String image;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  /// ------------------ FROM JSON ------------------
  factory ArticleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ArticleModel(
        id: 0,
        title: '',
        description: '',
        image: '',
      );
    }

    return ArticleModel(
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
  static List<ArticleModel> listFromJson(List? list) {
    if (list == null || list.isEmpty) return [];

    return list.map((e) => ArticleModel.fromJson(e)).toList();
  }
}
