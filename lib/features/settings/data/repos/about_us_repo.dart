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
import '../models/settings_item_response.dart';
import '../models/settings_items_respone.dart';


class AboutUsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Items
  Future<Either<String, SettingsItemsResponse>> getAllItems() async {
    try {
      final response = await dio.get(EndPoints.aboutUs, isFormData: false);
      return Right(SettingsItemsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllItems: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Add New Item
  /// [image] image of item
  /// [title] title of item
  /// [description] description of item
  Future<Either<String, SimpleModel>> addNewItem({
    required PickedImage image,
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> data = {'title': title, 'description': description};
    try {
      final response = await dio.multipart(
        path: EndPoints.aboutUs,
        pickedImage: image,
        fields: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Update item
  Future<Either<String, SettingsItemResponse>> updateItem({
    required int id,
    required String title,
    required String description,
    PickedImage? image,
  }) async {
    Map<String, dynamic> data = {
      "_method": "PUT",
      'title': title,
      'description': description,
    };
    try {
      final response = await dio.multipart(
        path: '${EndPoints.aboutUs}/$id',
        pickedImage: image,
        fields: data,
      );
      return Right(SettingsItemResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Delete Item
  Future<Either<String, SimpleModel>> deleteItem({required int id}) async {
    try {
      final response = await dio.delete(
        '${EndPoints.aboutUs}/$id',
        isFormData: false,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
