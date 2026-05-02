import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/control_panel_response.dart';

class ControlPanelRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get Control Panel Data
  Future<Either<String, ControlPanelResponse>> getControlPanelData() async {
    try {
      final response = await dio.get(EndPoints.controlPanel, isFormData: false);
      return Right(ControlPanelResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getControlPanelData: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
