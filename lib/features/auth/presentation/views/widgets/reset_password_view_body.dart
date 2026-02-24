import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/auth_provider.dart';
import 'custom_auth_view.dart';
import 'reset_password_form.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesResetImage,
      isLoading: context.watch<AuthProvider>().checkResetPassword == null,
      showBackIcon: true,
      showHand: false,
      title: S.of(context).reset_password_title,
      subtitle: S.of(context).reset_password_subtitle,
      note: S.of(context).reset_password_note,
      form: ResetPasswordForm(onTap: onTap),
    );
  }
}
