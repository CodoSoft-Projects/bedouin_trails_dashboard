// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../trips_provider.dart';

Future<void> deleteTrip({
  required BuildContext context,
  required int id,
}) async {
  var prov = context.read<TripsProvider>();

  //* Show loading dialog
  loadingDialog(context);

  await prov.deleteTrip(id: id);

  //* Close loading dialog
  Navigator.pop(context);

  if (prov.checkDeleteTrip == true) {
    //* Close opend view
    Navigator.pop(context);

    //* Show success message
    AppMessage.successBar(context, message: prov.message);
  } else if (prov.checkDeleteTrip == false) {
    var check = checkUnauthenticated(context, msg: prov.message);

    if (check == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}
