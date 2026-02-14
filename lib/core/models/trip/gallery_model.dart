class GalleryModel {
  final int id;
  final String image;

  const GalleryModel({required this.id, required this.image});

  factory GalleryModel.fromJson(Map<String, dynamic>? json) {
    return GalleryModel(id: json?['id'] ?? 0, image: json?['image'] ?? '');
  }

  // empty constructor
  GalleryModel.empty() : this(id: 0, image: '');
}
