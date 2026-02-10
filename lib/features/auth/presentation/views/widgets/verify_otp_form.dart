import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth_provider.dart';
import 'pinput_field.dart';

class VerifyOtpForm extends StatelessWidget {
  const VerifyOtpForm({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 32),
          PinputField(
            length: 6,
            controller: context.read<AuthProvider>().otpController,
          ),
          const Spacer(),
          CustomButton(
            text: "التالي",
            horizontalPadding: 75,
            color: AppColors.black,
            onPressed: onTap,
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
