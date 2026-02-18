import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/models/trip/trips_response_model.dart';
import '../../../../core/models/users_response_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';

class UsersRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Users
  Future<Either<String, UsersResponseModel>> getAllUsers({
    int page = 1,
    String search = '',
  }) async {
    try {
      final response = await dio.get(
        EndPoints.users,
        isFormData: false,
        queryParameters: {'page': page.toString(), 'search': search},
      );
      return Right(UsersResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllUsers: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Get User Trips
  Future<Either<String, TripsResponseModel>> getUserTrips({
    required int userId,
    int page = 1,
  }) async {
    try {
      final queryParameters = {'page': page.toString()};

      final response = await dio.get(
        '${EndPoints.users}/$userId',
        isFormData: false,
        queryParameters: queryParameters,
      );
      return Right(TripsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getUserTrips: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
