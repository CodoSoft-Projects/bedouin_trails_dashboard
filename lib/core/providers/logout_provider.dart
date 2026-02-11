import 'package:flutter/material.dart';

import '../services/hive_services.dart';
import '../../features/auth/data/repos/auth_repo.dart';

class LogoutProvider extends ChangeNotifier {
  final AuthRepo repo = AuthRepo();

  // logout
  bool? checkLogin = false;
  String message = '';

  Future<void> logout() async {
    checkLogin = null;
    message = '';
    notifyListeners();

    final res = await repo.logout();
    res.fold(
      (msg) {
        checkLogin = false;
        message = msg;
      },
      (model) {
        checkLogin = true;
        message = model.message;
        HiveServices.clearAccountModel();
        HiveServices.setAdminLoggedOut();
      },
    );
    notifyListeners();
  }
}
