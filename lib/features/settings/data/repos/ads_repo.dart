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
import '../models/settings_items_respone.dart';
import '../models/settings_item_response.dart';

class AdsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Ads
  Future<Either<String, SettingsItemsResponse>> getAllAds() async {
    try {
      final response = await dio.get(EndPoints.ads, isFormData: false);
      return Right(SettingsItemsResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllAds: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Add New Ads
  /// [image] image of ads
  /// [title] title of ads
  /// [description] description of ads
  Future<Either<String, SimpleModel>> addNewAdsItem({
    required PickedImage image,
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> data = {'title': title, 'description': description};
    try {
      final response = await dio.multipart(
        path: EndPoints.ads,
        pickedImage: image,
        fields: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addNewAdsItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Update Ads
  Future<Either<String, SettingsItemResponse>> updateAdsItem({
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
        path: '${EndPoints.ads}/$id',
        pickedImage: image,
        fields: data,
      );
      return Right(SettingsItemResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateAdsItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Delete Ads Item
  Future<Either<String, SimpleModel>> deleteAdsItem({required int id}) async {
    try {
      final response = await dio.delete(
        '${EndPoints.ads}/$id',
        isFormData: false,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteAdsItem: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
