import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';

//* Check if the user is unauthenticated.
//* If the user is unauthenticated,
//* clear the data and set the user as logged out.
void checkUnauthenticated(BuildContext context, {required String msg}) {
  if (msg == 'Unauthenticated') {
    // TODO: Active this two lines after create hive services, later.
    // HiveServices.clearAdminData();
    // HiveServices.setAdminLoggedOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginView.routeName,
      (_) => false,
    );
  }
}
