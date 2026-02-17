import 'package:flutter/material.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../services/hive_services.dart';

class LogoutProvider extends ChangeNotifier {
  final AuthRepo repo = AuthRepo();

  // logout
  bool? checklogout = false;
  String message = '';

  Future<void> logout() async {
    checklogout = null;
    message = '';
    notifyListeners();

    final res = await repo.logout();
    res.fold(
      (msg) {
        checklogout = false;
        message = msg;
      },
      (model) {
        checklogout = true;
        message = model.message;
        HiveServices.clearAccountModel();
        HiveServices.setAdminLoggedOut();
      },
    );
    notifyListeners();
  }
}
