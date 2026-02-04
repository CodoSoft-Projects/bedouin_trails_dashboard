import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../verify_otp_view.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        CustomEmailField(),
        const Spacer(),
        CustomButton(
          text: "التالي",
          horizontalPadding: 75,
          color: AppColors.black,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(VerifyOtpView.routeName);
          },
        ),
        const SizedBox(height: 42),
      ],
    );
  }
}
