import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'pinput_field.dart';

class VerifyOtpForm extends StatelessWidget {
  const VerifyOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 32),
          PinputField(
            length: 6,
            onChanged: (value) {},
            onCompleted: (value) {},
          ),
          const Spacer(),
          CustomButton(
            text: "التالي",
            horizontalPadding: 75,
            color: AppColors.black,
            onPressed: () {
              // Navigator.of(
              //   context,
              // ).pushReplacementNamed(ResetPasswordView.routeName);
            },
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
