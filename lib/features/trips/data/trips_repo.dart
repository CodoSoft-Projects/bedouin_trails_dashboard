import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/api/dio_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/enums/trip_status.dart';
import '../../../core/errors/exception.dart';
import '../../../core/functions/is_arabic.dart';
import '../../../core/models/picked_image_model.dart';
import '../../../core/models/simple_model.dart';
import '../../../core/models/trip/trip_response_model.dart';
import '../../../core/models/trip/trips_response_model.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/constants.dart';

class TripsRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Active Trips
  Future<Either<String, TripsResponseModel>> getAllActiveTrips({
    int page = 1,
    String search = '',
    String duration = '',
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.trips}?page=$page&search=$search&duration=$duration&status=active',
        isFormData: false,
      );
      return Right(TripsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllActiveTrips: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Get All Inactive Trips
  Future<Either<String, TripsResponseModel>> getAllInactiveTrips({
    int page = 1,
    String search = '',
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.trips}?page=$page&search=$search&status=inactive',
        isFormData: false,
      );
      return Right(TripsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllInactiveTrips: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Get trip details
  Future<Either<String, TripResponseModel>> getTripDetails({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.trips}/$id',
        isFormData: false,
      );
      return Right(TripResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getTripDetails: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// toggle trip status
  Future<Either<String, SimpleModel>> toggleTripStatus({
    required int id,
    required TripStatus status,
  }) async {
    try {
      var data = {"_method": "put", "status": status.name};
      log("Toggle Trip Status Data: $data");
      final response = await dio.post('${EndPoints.trips}/$id', data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in toggleTripStatus: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// update trip
  Future<Either<String, SimpleModel>> updateTrip({
    required int id,
    required String name,
    required String image,
    required double price,
    required String interfaceFrom,
    required String interfaceTo,
    required TripStatus status,
  }) async {
    try {
      var data = {
        "_method": "put",
        "status": status.name,
        "name": name,
        "image": image,
        "price": price,
        "interfaceFrom": interfaceFrom,
        "interfaceTo": interfaceTo,
      };
      log("Update Trip Data: $data");
      final response = await dio.post('${EndPoints.trips}/$id', data: data);
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateTrip: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// update trip [upload images for trip]
  Future<Either<String, SimpleModel>> updateTripImages({
    required int id,
    required List<PickedImage> images,
  }) async {
    try {
      final response = await dio.multipartMultipleImages(
        path: '${EndPoints.trips}/$id',
        images: images,
        fields: {"_method": "put"},
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateTripImages: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Delete Trip
  Future<Either<String, SimpleModel>> deleteTrip({required int id}) async {
    try {
      final response = await dio.delete(
        '${EndPoints.trips}/$id',
        isFormData: false,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in deleteTrip: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Remove trip image
  Future<Either<String, SimpleModel>> removeTripImage({
    required int imageId,
  }) async {
    try {
      final response = await dio.delete(
        '${EndPoints.trips}/images/$imageId',
        isFormData: false,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in removeTripImage: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Add Card to Trip Day
  Future<Either<String, SimpleModel>> addCardToTripDay({
    required int tripDayId,
    required PickedImage image,
    required String title,
    required String description,
  }) async {
    try {
      var data = {
        "trap_day_id": tripDayId,
        "title": title,
        "description": description,
      };
      final response = await dio.multipart(
        path: EndPoints.tripDayCard,
        pickedImage: image,
        fields: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in addCardToTripDay: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Update Card of Trip Day
  Future<Either<String, SimpleModel>> updateCardOfTripDay({
    required int cartId,
    required int tripDayId,
    required String title,
    required String description,
    required PickedImage? image,
  }) async {
    try {
      var data = {
        "_method": "put",
        "trap_day_id": tripDayId,
        "title": title,
        "description": description,
      };
      log("Update Card of Trip Day Data: $data");
      final response = await dio.post(
        '${EndPoints.tripDayCard}/$cartId',
        data: data,
      );
      return Right(SimpleModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateCardOfTripDay: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
