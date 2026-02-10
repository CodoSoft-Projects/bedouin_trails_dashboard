import 'package:flutter/material.dart';

import '../../../../core/models/account_model.dart';
import '../../../../core/services/hive_services.dart';
import '../../data/repos/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo repo = AuthRepo();

  // login
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //
  bool? checkLogin = false;
  String message = '';
  AccountModel? accountModel;
  Future<void> login() async {
    // Loading Signin
    checkLogin = null;
    message = '';
    notifyListeners();
    //
    final res = await repo.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    res.fold(
      (msg) {
        checkLogin = false;
        message = msg;
      },
      (model) {
        checkLogin = true;
        message = model.message;
        accountModel = model.account;
        HiveServices.saveAccountData(accountModel!);
        HiveServices.setAdminLoggedIn();
        emailController.clear();
        passwordController.clear();
      },
    );
    notifyListeners();
  }
}
