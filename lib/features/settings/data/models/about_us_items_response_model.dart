import 'about_us_model.dart';

class AboutUsItemsResponseModel {
  final bool status;
  final String message;
  final List<AboutUsModel> articles;

  const AboutUsItemsResponseModel({
    required this.status,
    required this.message,
    required this.articles,
  });

  factory AboutUsItemsResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AboutUsItemsResponseModel(
        status: false,
        message: '',
        articles: [],
      );
    }

    return AboutUsItemsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      articles: AboutUsModel.listFromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': articles.map((e) => e.toJson()).toList(),
    };
  }
}
