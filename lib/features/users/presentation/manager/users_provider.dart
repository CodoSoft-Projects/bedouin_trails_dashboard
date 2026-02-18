import 'package:flutter/material.dart';

import '../../../../core/models/user_model.dart';
import '../../data/repos/users_repo.dart';

class UsersProvider extends ChangeNotifier {
  UsersRepo repo = UsersRepo();

  String message = '';
  List<UserModel> users = [];
  var searchController = TextEditingController();

  /// Get All Users
  bool? checkGettingAllUser = false;
  Future<void> getAllUsers() async {
    checkGettingAllUser = null;
    notifyListeners();

    final result = await repo.getAllUsers(search: searchController.text);
    result.fold(
      (msg) {
        message = msg;
        checkGettingAllUser = false;
      },
      (model) {
        message = model.message;
        users = model.users;
        checkGettingAllUser = true;
      },
    );
    notifyListeners();
  }

}