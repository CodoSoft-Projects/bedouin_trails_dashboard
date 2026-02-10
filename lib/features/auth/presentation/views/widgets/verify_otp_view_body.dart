import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_auth_view.dart';
import 'verify_otp_form.dart';

class VerifyOtpViewBody extends StatelessWidget {
  const VerifyOtpViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesForgetImage,
      showBackIcon: true,
      showHand: false,
      title: 'إعادة تعيين كلمة المرور',
      subtitle: 'أدخل رقم التأكيدالذي تم إرساله عبر لإيميل',
      note:
          'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
      form: VerifyOtpForm(onTap: onTap),
    );
  }
}
