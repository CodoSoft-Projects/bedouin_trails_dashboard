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
        // TODO : review this condition
        if (model.account.isAdmin == true) 
        HiveServices.setAdminLoggedIn();
        emailController.clear();
        passwordController.clear();
      },
    );
    notifyListeners();
  }

  /// Forget Password
  var forgetFormKey = GlobalKey<FormState>();
  var forgetEmailController = TextEditingController();

  bool? checkForgetPassword = false;
  Future<void> forgetPassword() async {
    checkForgetPassword = null;
    message = '';
    notifyListeners();
    final res = await repo.forgetPassword(
      email: forgetEmailController.text.trim(),
    );
    res.fold(
      (msg) {
        checkForgetPassword = false;
        message = msg;
      },
      (model) {
        checkForgetPassword = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  // Verify OTP
  var otpController = TextEditingController();

  bool? checkVerifyOTP = false;
  Future<void> verifyOTP() async {
    checkVerifyOTP = null;
    message = '';
    notifyListeners();
    final res = await repo.verifyOTP(
      email: forgetEmailController.text,
      otp: otpController.text,
    );
    res.fold(
      (msg) {
        checkVerifyOTP = false;
        message = msg;
      },
      (model) {
        checkVerifyOTP = true;
        message = model.message;
      },
    );
    notifyListeners();
  }

  //* Reset Password
  var resetFormKey = GlobalKey<FormState>();
  var resetPasswordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  bool? checkResetPassword = false;
  Future<void> resetPassword() async {
    checkResetPassword = null;
    message = '';
    notifyListeners();
    final res = await repo.resetPassword(
      email: forgetEmailController.text,
      password: resetPasswordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );
    res.fold(
      (msg) {
        checkResetPassword = false;
        message = msg;
      },
      (model) {
        checkResetPassword = true;
        message = model.message;
        clearControllers();
      },
    );
    notifyListeners();
  }

  void clearControllers() {
    forgetEmailController.clear();
    otpController.clear();
    resetPasswordController.clear();
    passwordConfirmationController.clear();
  }
}
