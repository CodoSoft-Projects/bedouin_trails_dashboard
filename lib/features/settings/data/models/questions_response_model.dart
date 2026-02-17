import 'question_model.dart';

class QuestionsResponseModel {
  final bool status;
  final String message;
  final List<QuestionModel> questions;

  const QuestionsResponseModel({
    required this.status,
    required this.message,
    required this.questions,
  });

  factory QuestionsResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const QuestionsResponseModel(
        status: false,
        message: '',
        questions: [],
      );
    }

    return QuestionsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      questions: QuestionModel.listFromJson(json['data']),
    );
  }
}
