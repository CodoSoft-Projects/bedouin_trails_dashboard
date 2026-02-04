import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view.dart';
import 'widgets/verify_otp_form.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});
  static const String routeName = 'verify-otp-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthView(
        image: Assets.imagesForgetImage,
        showBackIcon: true,
        showHand: false,
        title: 'إعادة تعيين كلمة المرور',
        subtitle: 'أدخل رقم التأكيدالذي تم إرساله عبر لإيميل',
        note:
            'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
        form: VerifyOtpForm(),
      ),
    );
  }
}
