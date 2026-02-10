import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_auth_view.dart';
import 'forget_password_form.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesForgetImage,
      showBackIcon: true,
      showHand: false,
      title: 'إعادة تعيين كلمة المرور',
      subtitle: 'أدخل البيانات المطلوبة لإعادة تعيين كلمة المرور',
      note:
          'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
      form: ForgetPasswordForm(onTap: onTap),
    );
  }
}
