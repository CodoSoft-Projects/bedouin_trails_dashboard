class QuestionModel {
  final int id;
  final String question;
  final String answer;

  const QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  /// ------------------ FROM JSON ------------------
  factory QuestionModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const QuestionModel(id: 0, question: '', answer: '');
    }

    return QuestionModel(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }

  /// ------------------ TO JSON ------------------
  Map<String, dynamic> toJson() {
    return {'id': id, 'question': question, 'answer': answer};
  }

  /// ------------------ LIST PARSER ------------------
  static List<QuestionModel> listFromJson(List? list) {
    if (list == null || list.isEmpty) return [];

    return list.map((e) => QuestionModel.fromJson(e)).toList();
  }

  static const empty = QuestionModel(id: 0, question: '', answer: '');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionModel &&
          runtimeType == other.runtimeType &&
          other.id == id &&
          other.question == question &&
          other.answer == answer;

  @override
  int get hashCode => id.hashCode;
}
