import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_auth_view.dart';
import 'reset_password_form.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesResetImage,
      showBackIcon: true,
      showHand: false,
      title: 'أدخل كلمة المرور الجديدة',
      subtitle: 'قم بإدخال كلمة مرور متاحة',
      note:
          'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
      form: ResetPasswordForm(onTap: onTap),
    );
  }
}
