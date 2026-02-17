import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/articles_respnse_model.dart';

class ArticlesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Articles
  Future<Either<String, ArticlesResponseModel>> getAllArticles() async {
    try {
      final response = await dio.get(EndPoints.articles);
      return Right(ArticlesResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllArticles: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
