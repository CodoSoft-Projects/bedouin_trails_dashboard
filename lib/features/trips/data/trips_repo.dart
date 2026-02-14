import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/api/dio_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/errors/exception.dart';
import '../../../core/functions/is_arabic.dart';
import '../../../core/models/trip/trips_response_model.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/constants.dart';

class TripsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Active Trips
  Future<Either<String, TripsResponseModel>> getAllActiveTrips() async {
    try {
      final response = await dio.get(EndPoints.trips, isFormData: false);
      return Right(TripsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in signin: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
