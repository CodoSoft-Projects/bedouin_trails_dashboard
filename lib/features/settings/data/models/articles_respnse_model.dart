import 'article_model.dart';

class ArticlesResponseModel {
  final bool status;
  final String message;
  final List<ArticleModel> articles;

  const ArticlesResponseModel({
    required this.status,
    required this.message,
    required this.articles,
  });

  factory ArticlesResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ArticlesResponseModel(
        status: false,
        message: '',
        articles: [],
      );
    }

    return ArticlesResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      articles: ArticleModel.listFromJson(json['data']),
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
