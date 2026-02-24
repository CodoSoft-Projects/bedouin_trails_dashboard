import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../generated/l10n.dart';
import 'change_password_form.dart';

Future<void> changePasswordDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        title: S.of(context).changePassword,
        content: SizedBox(width: 500, child: ChangePasswordForm()),
      );
    },
  );
}
