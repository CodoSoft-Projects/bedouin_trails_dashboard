import '../../../../core/models/account_model.dart';
import '../../../../core/models/pagination_model.dart';

class EmployeesResponseModel {
  final bool status;
  final String message;
  final List<AccountModel> employees;
  final PaginationModel pagination;

  const EmployeesResponseModel({
    required this.status,
    required this.message,
    required this.employees,
    required this.pagination,
  });

  factory EmployeesResponseModel.fromJson(Map<String, dynamic>? json) {
    final dataList = (json?['data'] as List?) ?? [];

    return EmployeesResponseModel(
      status: json?['status'] ?? false,
      message: json?['message'] ?? '',
      employees: dataList.map((e) => AccountModel.fromJson(e)).toList(),
      pagination: PaginationModel.fromJson(json?['pagination']),
    );
  }
}
