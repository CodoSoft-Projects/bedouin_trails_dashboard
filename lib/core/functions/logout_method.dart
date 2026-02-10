import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../helpers/dialog_helper.dart';
import '../services/hive_services.dart';

void logout(BuildContext context) {
  DialogHelper.showQuestionDialog(
    context,
    title: 'تسجيل الخروج',
    desc: 'هل ترغب في تسجيل الخروج من التطبيق؟',
    btnOkText: 'نعم',
    btnCancelText: 'لا',
    onCancel: () {},
    onOk: () {
      HiveServices.clearAccountModel();
      HiveServices.setAdminLoggedOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginView.routeName,
        (_) => false,
      );
    },
  );
}
