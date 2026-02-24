import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';
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
      title: S.of(context).verify_email_title,
      subtitle: S.of(context).verify_email_subtitle,
      note: S.of(context).verify_email_note,
      form: VerifyOtpForm(onTap: onTap),
    );
  }
}
