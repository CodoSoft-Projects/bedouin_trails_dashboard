import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../manager/auth_provider.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var prov = context.read<AuthProvider>();
    return Form(
      key: prov.resetFormKey,
      child: Column(
        spacing: 12,
        children: [
          const SizedBox(height: 32),
          CustomPasswordField(controller: prov.resetPasswordController),
          CustomPasswordField(
            hintText: 'تاكيد كلمة المرور',
            controller: prov.passwordConfirmationController,
          ),
          const SizedBox(height: 32),

          const Spacer(),
          CustomButton(
            text: 'تغيير كلمة المرور',
            color: AppColors.black,
            horizontalPadding: 75,
            onPressed: onTap,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
