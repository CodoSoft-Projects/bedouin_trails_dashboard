import 'article_model.dart';

class ArticleResponseModel {
  final bool status;
  final String message;
  final ArticleModel article;

  const ArticleResponseModel({
    required this.status,
    required this.message,
    required this.article,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ArticleResponseModel(
        status: false,
        message: '',
        article: ArticleModel.empty,
      );
    }

    return ArticleResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      article: ArticleModel.fromJson(json['data']),
    );
  }
}
