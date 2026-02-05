import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view.dart';
import 'widgets/reset_password_form.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String routeName = 'reset-password-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthView(
        image: Assets.imagesResetImage,
        showBackIcon: true,
        showHand: false,
        title: 'أدخل كلمة المرور الجديدة',
        subtitle: 'قم بإدخال كلمة مرور متاحة',
        note:
            'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
        form: ResetPasswordForm(),
      ),
    );
  }
}
