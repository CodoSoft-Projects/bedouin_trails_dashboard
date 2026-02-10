import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/auth_model.dart';

class AuthRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  Future<Either<String, AuthModel>> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {'email': email, 'password': password};
    try {
      final response = await dio.post(EndPoints.login, data: data);
      return Right(AuthModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in signin: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
