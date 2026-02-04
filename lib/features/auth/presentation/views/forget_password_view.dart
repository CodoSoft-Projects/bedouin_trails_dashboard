import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forget-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthView(
        image: Assets.imagesForgetImage,
        showBackIcon: true,
        showHand: false,
        title: 'إعادة تعيين كلمة المرور',
        subtitle: 'أدخل البيانات المطلوبة لإعادة تعيين كلمة المرور',
        note:
            'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
        form: ForgetPasswordForm(),
      ),
    );
  }
}
