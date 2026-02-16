import '../../../../core/models/account_model.dart';

class EmployeeResponseModel {
  final bool status;
  final String message;
  final AccountModel employee;

  const EmployeeResponseModel({
    required this.status,
    required this.message,
    required this.employee,
  });

  factory EmployeeResponseModel.fromJson(Map<String, dynamic>? json) {
    return EmployeeResponseModel(
      status: json?['status'] ?? false,
      message: json?['message'] ?? '',
      employee: AccountModel.fromJson(json?['data'] ?? {}),
    );
  }
}
