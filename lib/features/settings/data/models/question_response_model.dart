import 'question_model.dart';

class ArticleResponseModel {
  final bool status;
  final String message;
  final QuestionModel question;

  const ArticleResponseModel({
    required this.status,
    required this.message,
    required this.question,
  });

  factory ArticleResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ArticleResponseModel(
        status: false,
        message: '',
        question: QuestionModel.empty,
      );
    }

    return ArticleResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      question: QuestionModel.fromJson(json['data']),
    );
  }
}
