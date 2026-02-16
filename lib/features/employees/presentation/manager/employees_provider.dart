import 'package:flutter/material.dart';

import '../../../../core/models/account_model.dart';
import '../../data/repos/employees_repo.dart';

class EmployeesProvider extends ChangeNotifier {
  EmployeesRepo repo = EmployeesRepo();

  String message = '';

  /// Get All Employees
  List<AccountModel> employees = [];

  bool? checkGettingEmployees = false;

  Future<void> getAllEmployees() async {
    checkGettingEmployees = null;
    notifyListeners();

    final result = await repo.getAllEmployees();
    result.fold(
      (msg) {
        message = msg;
        checkGettingEmployees = false;
      },
      (model) {
        employees = model.employees;
        checkGettingEmployees = true;
      },
    );
    notifyListeners();
  }
}
