import 'package:flutter/material.dart';

import '../../../../core/models/pagination_model.dart';
import '../../../../core/models/user_model.dart';
import '../../data/repos/users_repo.dart';

class UsersProvider extends ChangeNotifier {
  UsersRepo repo = UsersRepo();

  String message = '';
  List<UserModel> users = [];
  UserModel? selectedUser;
  PaginationModel pagination = PaginationModel.empty();
  var searchController = TextEditingController();

  /// Get All Users
  bool? checkGettingAllUser = false;
  Future<void> getAllUsers({int page = 1}) async {
    checkGettingAllUser = null;
    notifyListeners();

    final result = await repo.getAllUsers(
      search: searchController.text,
      page: page,
    );
    result.fold(
      (msg) {
        message = msg;
        checkGettingAllUser = false;
      },
      (model) {
        message = model.message;
        users = model.users;
        pagination = model.pagination;
        checkGettingAllUser = true;
      },
    );
    notifyListeners();
  }

  void onSelectUser(UserModel user) {
    selectedUser = user;
    notifyListeners();
  }
}
