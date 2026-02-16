import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/models/account_model.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/constants.dart';
import '../models/employee_response_model.dart';
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

  /// Update Employee Data
  Future<Either<String, EmployeeResponseModel>> updateEmployeeData({
    required AccountModel account,
    required PickedImage? image,
  }) async {
    try {
      var data = {"_method": "put", ...account.toJson()};
      log("Update Employee Data: $data");
      final response = await dio.multipart(
        path: '${EndPoints.employees}/${account.id}',
        fields: data,
        pickedImage: image,
      );
      return Right(EmployeeResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in updateEmployeeData: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }

  /// Toggle Account Status
  Future<Either<String, EmployeeResponseModel>> toggleAccountStatus({
    required int id,
    required int status,
  }) async {
    try {
      var data = {"_method": "put", "status": status};
      log("Toggle Account status: $data");

      final response = await dio.post('${EndPoints.employees}/$id', data: data);
      return Right(EmployeeResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      log("Exception in toggleAccountStatus: $e");
      return Left(isArabic() ? Constants.kArErrorMsg : Constants.kEnErrorMsg);
    }
  }
}
