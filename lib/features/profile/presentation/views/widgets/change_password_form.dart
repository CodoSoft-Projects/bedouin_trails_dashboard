import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(height: 24),
          CustomPasswordField(hintText: 'كلمة المرور الحالية'),
          CustomPasswordField(hintText: 'كلمة المرور الجديدة'),
          CustomPasswordField(hintText: 'تاكيد كلمة المرور'),
          const SizedBox(height: 24),
          CustomButton(
            text: 'حفظ',
            color: AppColors.sandyBrown,
            horizontalPadding: 72,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
