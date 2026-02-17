import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/models/simple_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/article_response_model.dart';
import '../models/articles_response_model.dart';

class ArticlesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Articles
  Future<Either<String, ArticlesResponseModel>> getAllArticles() async {
    try {
      final response = await dio.get(EndPoints.articles, isFormData: false);
      return Right(ArticlesResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllArticles: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Add New Article
  /// [image] image of article
  /// [title] title of article
  /// [description] description of article
  Future<Either<String, SimpleModel>> addNewArticle({
    required PickedImage image,
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> data = {'title': title, 'description': description};
    try {
      final response = await dio.multipart(
        path: EndPoints.articles,
        pickedImage: image,
        fields: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewArticle: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Update Article
  Future<Either<String, ArticleResponseModel>> updateArticle({
    required int id,
    required String title,
    required String description,
    PickedImage? image,
  }) async {
    Map<String, dynamic> data = {'title': title, 'description': description};
    try {
      final response = await dio.multipart(
        path: '${EndPoints.articles}/$id',
        pickedImage: image,
        fields: data,
      );
      return Right(ArticleResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateArticle: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
