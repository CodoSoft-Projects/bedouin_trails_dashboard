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
import '../../../auth/data/models/auth_model.dart';

class ProfileRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  //* Change Password
  Future<Either<String, SimpleModel>> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var data = {
        '_method': 'put',
        'current_password': currentPassword,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
      log("Change Password Data: $data");
      var response = await dio.post(EndPoints.profile, data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  //* Update Profile
  Future<Either<String, AuthModel>> updateProfile({
    required PickedImage? image,
    required String fname,
    required String lname,
    required String email,
    required String phone,
  }) async {
    try {
      var data = {
        '_method': 'put',
        'first_name': fname,
        'last_name': lname,
        'phone': phone,
        'email': email,
      };
      final response = await dio.multipart(
        path: EndPoints.profile,
        pickedImage: image,
        fields: data,
      );
      return Right(AuthModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateProfile: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
