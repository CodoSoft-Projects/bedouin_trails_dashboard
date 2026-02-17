import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/question_response_model.dart';
import '../models/questions_response_model.dart';

class QuestionsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Questions
  Future<Either<String, QuestionsResponseModel>> getAllQuestions() async {
    try {
      final response = await dio.get(EndPoints.questions, isFormData: false);
      return Right(QuestionsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllQuestions: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Add New Question
  /// [question] question of question
  /// [answer] answer of question
  Future<Either<String, SimpleModel>> addNewQuestion({
    required String question,
    required String answer,
  }) async {
    Map<String, dynamic> data = {'question': question, 'answer': answer};
    try {
      final response = await dio.post(EndPoints.questions, data: data);
      
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewQuestion: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Update Question
  Future<Either<String, QuestionResponseModel>> updateQuestion({
    required int id,
    required String question,
    required String answer,
  }) async {
    Map<String, dynamic> data = {
      "_method": "PUT",
      'question': question,
      'answer': answer,
    };

    try {
      final response = await dio.post(
         '${EndPoints.questions}/$id',
        data: data,
      );
      return Right(QuestionResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateQuestion: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Delete Question
  Future<Either<String, SimpleModel>> deleteQuestion({required int id}) async {
    try {
      final response = await dio.delete(
        '${EndPoints.questions}/$id',
        isFormData: false,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteQuestion: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
