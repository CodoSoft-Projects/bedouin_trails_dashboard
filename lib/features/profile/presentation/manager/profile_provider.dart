import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/account_model.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/services/hive_services.dart';
import '../../data/repo/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileRepo repo = ProfileRepo();

  AccountModel? accountModel;

  void saveAdminData(AccountModel data) {
    HiveServices.saveAccountData(data);
  }

  void getAccountData() {
    accountModel = HiveServices.getAccountData();
    log("Account data: $accountModel");
    fillAdminData();
    notifyListeners();
  }

  void clearUserData() {
    HiveServices.clearAccountModel();
    notifyListeners();
  }

  // Profile Controllers & form key
  var formKey = GlobalKey<FormState>();
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  void fillAdminData() {
    fnameController.text = accountModel?.firstName ?? '';
    lnameController.text = accountModel?.lastName ?? '';
    emailController.text = accountModel?.email ?? '';
    phoneController.text = accountModel?.phone ?? '';
  }

  // Change Password
  bool? checkChangingPassword = false;
  String checkChangingPasswordMessage = '';

  var changePasswordFormKey = GlobalKey<FormState>();
  var currentPassword = TextEditingController();
  var password = TextEditingController();
  var passwordConfirmation = TextEditingController();

  Future<void> changePassword() async {
    checkChangingPassword = null;
    notifyListeners();
    final response = await repo.changePassword(
      currentPassword: currentPassword.text.trim(),
      password: password.text.trim(),
      passwordConfirmation: passwordConfirmation.text.trim(),
    );
    response.fold(
      (msg) {
        checkChangingPasswordMessage = msg;
        checkChangingPassword = false;
      },
      (authModel) {
        checkChangingPassword = true;
        checkChangingPasswordMessage = authModel.message;
        currentPassword.clear();
        password.clear();
        passwordConfirmation.clear();
      },
    );
    notifyListeners();
  }

  // Update profile
  bool? checkUpdateProfile = false;
  String message = '';

  Future<void> updateProfile() async {
    checkUpdateProfile = null;
    message = '';
    notifyListeners();

    final result = await repo.updateProfile(
      image: imageFile,
      fname: fnameController.text,
      lname: lnameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdateProfile = false;
      },
      (authModel) {
        message = authModel.message;
        checkUpdateProfile = true;
        imageFile = null;
        saveAdminData(authModel.account);
        // fillLocationDetails(authModel.data!);
        getAccountData();
      },
    );
    notifyListeners();
  }

  //* Location Model

  PickedImage? imageFile;
  void pickFromGallery() async {
    imageFile = await pickImageUniversal();
    notifyListeners();
  }

  void pickFromCamera() async {
    imageFile = await pickImageUniversal();
    notifyListeners();
  }

  void clearImage() {
    imageFile = null;
    notifyListeners();
  }
}
