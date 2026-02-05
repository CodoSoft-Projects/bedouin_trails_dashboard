import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        const SizedBox(height: 32),
        CustomPasswordField(),
        CustomPasswordField(hintText: 'تاكيد كلمة المرور'),
        const SizedBox(height: 32),

        const Spacer(),
        CustomButton(
          text: 'تغيير كلمة المرور',
          color: AppColors.black,
          horizontalPadding: 75,
          onPressed: () {
            Navigator.pop(context);

            DialogHelper.showSuccessDialog(
              context,
              title: 'تم تغيير كلمة المرور بنجاح',
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
