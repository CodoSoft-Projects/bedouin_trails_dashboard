import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/account_model.dart';
import '../../../../core/models/pagination_model.dart';
import '../../../../core/models/permissions_model.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../data/enums/filter_employee_type.dart';
import '../../data/repos/employees_repo.dart';

class EmployeesProvider extends ChangeNotifier {
  EmployeesRepo repo = EmployeesRepo();

  String message = '';

  /// Get All Employees
  List<AccountModel> employees = [];
  PaginationModel pagination = PaginationModel.empty();
  var searchController = TextEditingController();
  FilterEmployeeType filter = FilterEmployeeType.active;

  bool? checkGettingEmployees = false;

  Future<void> getAllEmployees({int page = 1, int? status}) async {
    checkGettingEmployees = null;
    notifyListeners();

    final result = await repo.getAllEmployees(
      page: page,
      search: searchController.text.trim(),
      filter: filter,
    );

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

  void onChangeFilter(FilterEmployeeType filter) {
    this.filter = filter;
    getAllEmployees();
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
    log("Fill Employee Data: ${employee.toJson()}");
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
  }

  //* ==========================================
  /// Add New Employee
  bool? checkAddingNewEmployee = false;

  Future<void> addNewEmployee() async {
    checkAddingNewEmployee = null;
    notifyListeners();

    final result = await repo.addNewEmployee(
      fname: fnameController.text,
      lname: lnameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      image: pickedImage!,
      permissions: permissions,
    );

    result.fold(
      (msg) {
        message = msg;
        checkAddingNewEmployee = false;
        notifyListeners();
      },
      (model) {
        checkAddingNewEmployee = true;
        message = model.message;
        getAllEmployees();
      },
    );
  }

  /// Update Employee Data
  bool? checkUpdatingEmployee = false;

  Future<void> updateEmployeeData() async {
    checkUpdatingEmployee = null;
    notifyListeners();

    final result = await repo.updateEmployeeData(
      account: AccountModel.empty().copyWith(
        id: selectedEmployee!.id,
        firstName: fnameController.text,
        lastName: lnameController.text,
        email: emailController.text,
        phone: phoneController.text,
        permissions: permissions,
      ),
      image: pickedImage,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingEmployee = false;
        notifyListeners();
      },
      (model) {
        checkUpdatingEmployee = true;
        message = model.message;
        onClearImage();
        selectEmployee(model.employee);
        getAllEmployees();
      },
    );
  }

  /// Toggle Account Status
  Future<void> toggleAccountStatus() async {
    checkUpdatingEmployee = null;
    notifyListeners();

    final result = await repo.toggleAccountStatus(
      id: selectedEmployee!.id,
      status: selectedEmployee!.status,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingEmployee = false;
        notifyListeners();
      },
      (model) {
        checkUpdatingEmployee = true;
        message = model.message;
        selectEmployee(model.employee);
        getAllEmployees();
      },
    );
  }
}
