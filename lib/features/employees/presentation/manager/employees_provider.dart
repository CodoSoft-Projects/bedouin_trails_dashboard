import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/account_model.dart';
import '../../../../core/models/permissions_model.dart';
import '../../../../core/models/picked_image_model.dart';
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

  /// Employee data controllers
  PickedImage? pickedImage;
  var formKey = GlobalKey<FormState>();
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  PermissionsModel permissions = PermissionsModel.empty();

  void fillEmployeeData(AccountModel employee) {
    fnameController.text = employee.firstName;
    lnameController.text = employee.lastName;
    emailController.text = employee.email;
    phoneController.text = employee.phone;
    permissions = employee.permissions;
    notifyListeners();
  }

  void onChangePermission({
    bool? manageTrips,
    bool? manageSuspendedTrips,
    bool? manageUsers,
    bool? manageBookingRequests,
    bool? manageWebsite,
  }) {
    permissions = permissions.copyWith(
      manageTrips: manageTrips,
      manageSuspendedTrips: manageSuspendedTrips,
      manageUsers: manageUsers,
      manageBookingRequests: manageBookingRequests,
      manageWebsite: manageWebsite,
    );
    notifyListeners();
  }

  void clearEmployeeData() {
    fnameController.clear();
    lnameController.clear();
    emailController.clear();
    phoneController.clear();
    permissions = PermissionsModel.empty();
    onClearImage();
    notifyListeners();
  }

  void onPickImage() async {
    pickedImage = await pickImageUniversal();
    notifyListeners();
  }

  void onClearImage() {
    pickedImage = null;
    notifyListeners();
  }

  /// Selected employee
  AccountModel? selectedEmployee;

  void selectEmployee(AccountModel employee) {
    selectedEmployee = employee;
    fillEmployeeData(employee);
    notifyListeners();
  }
}
