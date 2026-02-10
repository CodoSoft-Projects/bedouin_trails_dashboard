import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../manager/auth_provider.dart';
import 'custom_auth_view.dart';
import 'verify_otp_form.dart';

class VerifyOtpViewBody extends StatelessWidget {
  const VerifyOtpViewBody({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomAuthView(
      image: Assets.imagesForgetImage,
      isLoading: context.watch<AuthProvider>().checkVerifyOTP == null,
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
