import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/auth_provider.dart';
import 'custom_auth_view.dart';
import 'forget_password_form.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesForgetImage,
      isLoading: context.watch<AuthProvider>().checkForgetPassword == null,
      showBackIcon: true,
      showHand: false,
      title: S.of(context).forget_password_title,
      subtitle: S.of(context).forget_password_subtitle,
      note: S.of(context).forget_password_note,
      form: ForgetPasswordForm(onTap: onTap),
    );
  }
}
