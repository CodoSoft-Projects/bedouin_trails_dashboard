import 'package:flutter/material.dart';

import '../../data/models/question_model.dart';
import '../../data/repos/qustions_repo.dart';

class QuestionsProvider extends ChangeNotifier {
  QuestionsRepo repo = QuestionsRepo();

  String message = '';

  List<QuestionModel> questions = [];
  QuestionModel? selectedQuestion;
  var formKey = GlobalKey<FormState>();
  var questionController = TextEditingController();
  var answerController = TextEditingController();

  /// Get All Questions
  bool? checkGettingQuestions = false;

  Future<void> getAllQuestions() async {
    checkGettingQuestions = null;
    notifyListeners();

    final result = await repo.getAllQuestions();
    result.fold(
      (msg) {
        message = msg;
        checkGettingQuestions = false;
      },
      (model) {
        questions = model.questions;
        if (questions.isNotEmpty) onSelectQuestion(questions.first);
        message = model.message;
        checkGettingQuestions = true;
      },
    );
    notifyListeners();
  }

  void fillControllers(QuestionModel? question) {
    var newQuestion = question ?? selectedQuestion;
    questionController.text = newQuestion!.question;
    answerController.text = newQuestion.answer;
    notifyListeners();
  }

  void clearControllers() {
    questionController.clear();
    answerController.clear();
    notifyListeners();
  }

  void onSelectQuestion(QuestionModel question) {
    selectedQuestion = question;
    fillControllers(question);
  }

  /// Add New Question
  bool? checkAddingQuestion = false;

  Future<void> addNewQuestion() async {
    checkAddingQuestion = null;
    notifyListeners();

    final result = await repo.addNewQuestion(
      question: questionController.text,
      answer: answerController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkAddingQuestion = false;
      },
      (model) {
        message = model.message;
        checkAddingQuestion = true;
        clearControllers();
        getAllQuestions();
      },
    );
    notifyListeners();
  }

  /// Update Question
  bool? checkUpdatingQuestion = false;

  Future<void> updateQuestion() async {
    checkUpdatingQuestion = null;
    notifyListeners();

    final result = await repo.updateQuestion(
      id: selectedQuestion!.id,
      question: questionController.text,
      answer: answerController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingQuestion = false;
      },
      (model) {
        message = model.message;
        checkUpdatingQuestion = true;
        onSelectQuestion(model.question);
        replaceQuestion(model.question);
      },
    );
    notifyListeners();
  }

  /// Replace Question form the list with new Question
  void replaceQuestion(QuestionModel question) {
    final index = questions.indexWhere((element) => element.id == question.id);
    questions[index] = question;
    notifyListeners();
  }

  /// Delete Question
  bool? checkDeletingQuestion = false;

  Future<void> deleteQuestion() async {
    checkDeletingQuestion = null;
    notifyListeners();

    final result = await repo.deleteQuestion(id: selectedQuestion!.id);
    result.fold(
      (msg) {
        message = msg;
        checkDeletingQuestion = false;
      },
      (model) {
        message = model.message;
        checkDeletingQuestion = true;
        questions.removeWhere((element) => element.id == selectedQuestion!.id);
        selectedQuestion = null;
        if (questions.isNotEmpty) onSelectQuestion(questions.first);
      },
    );
    notifyListeners();
  }
}
