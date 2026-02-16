import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/employees_response_model.dart';

class EmployeesRepo {
  final DioConsumer dio = getit.get<DioConsumer>();

  /// Get All Employees
  Future<Either<String, EmployeesResponseModel>> getAllEmployees() async {
    try {
      final response = await dio.get(EndPoints.employees, isFormData: false);
      return Right(EmployeesResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in getAllEmployees: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
