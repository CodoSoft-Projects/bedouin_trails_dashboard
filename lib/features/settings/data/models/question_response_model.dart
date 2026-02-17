import 'question_model.dart';

class QuestionResponseModel {
  final bool status;
  final String message;
  final QuestionModel question;

  const QuestionResponseModel({
    required this.status,
    required this.message,
    required this.question,
  });

  factory QuestionResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const QuestionResponseModel(
        status: false,
        message: '',
        question: QuestionModel.empty,
      );
    }

    return QuestionResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      question: QuestionModel.fromJson(json['data']),
    );
  }
}
