import 'dart:developer';

import 'package:hive/hive.dart';

import '../api/api_keys.dart';
import '../models/account_model.dart';
import '../models/permissions_model.dart';
import '../utils/constants.dart';

class HiveServices {
  static var adminBox = Hive.box(ApiKeys.accountData);
  // Save Admin Data
  static void saveAccountData(AccountModel data) {
    log("Save Account Data: ${data.toJson()}");
    if (data.id != 0) adminBox.put(ApiKeys.id, data.id);
    if (data.token.isNotEmpty) adminBox.put(ApiKeys.token, data.token);
    if (data.firstName.isNotEmpty) adminBox.put(ApiKeys.fname, data.firstName);
    if (data.lastName.isNotEmpty) adminBox.put(ApiKeys.lname, data.lastName);

    if (data.phone.isNotEmpty) adminBox.put(ApiKeys.phone, data.phone);
    if (data.email.isNotEmpty) adminBox.put(ApiKeys.email, data.email);
    if (data.image.isNotEmpty) adminBox.put(ApiKeys.image, data.image);

    if (data.role.isNotEmpty) adminBox.put(ApiKeys.role, data.role);
    if (data.permissions.toJson().isNotEmpty) {
      adminBox.put(ApiKeys.permissions, data.permissions.toJson());
    }
  }

  /// Get Admin Data
  static AccountModel getAccountData() {
    // Get Permissions
    final storedPermissions = adminBox.get(ApiKeys.permissions) ?? {};
    final permissions = PermissionsModel.fromJson(
      Map<String, dynamic>.from(storedPermissions),
    );
    var accountModel = AccountModel(
      otp: 0,
      id: adminBox.get(ApiKeys.id),
      token: adminBox.get(ApiKeys.token),
      firstName: adminBox.get(ApiKeys.fname),
      lastName: adminBox.get(ApiKeys.lname),
      phone: adminBox.get(ApiKeys.phone),
      email: adminBox.get(ApiKeys.email),
      image: adminBox.get(ApiKeys.image),
      role: adminBox.get(ApiKeys.role),
      permissions: permissions,
    );
    log("Get Admin Data: ${accountModel.toJson()}");
    return accountModel;
  }

  /// Get only token
  static String? getToken() {
    var hiveBox = Hive.box(ApiKeys.accountData);
    return hiveBox.get(ApiKeys.token);
  }

  /// Clear all  data
  static void clearAccountModel() {
    var hiveBox = Hive.box(ApiKeys.accountData);
    hiveBox.clear();
  }

  // set Admin is logged in
  static void setAdminLoggedIn() {
    var hiveBox = Hive.box(Constants.isLoggedIn);
    hiveBox.put(Constants.isLoggedIn, true);
  }

  // set Admin is logged out
  static void setAdminLoggedOut() {
    var hiveBox = Hive.box(Constants.isLoggedIn);
    hiveBox.put(Constants.isLoggedIn, false);
  }

  // get Admin is logged in
  static bool isAdminLoggedIn() {
    var hiveBox = Hive.box(Constants.isLoggedIn);
    return hiveBox.get(Constants.isLoggedIn, defaultValue: false) as bool;
  }
}
