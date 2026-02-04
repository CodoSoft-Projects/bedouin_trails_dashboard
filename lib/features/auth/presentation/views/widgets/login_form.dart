import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomEmailField(),
        CustomPasswordField(),

        const SizedBox(height: 32),
        CustomTextButton(
          title: 'هل نسيت كلمة المرور ؟!',
          onTap: () {
            // Navigator.pushNamed(context, ForgetPasswordView.routeName);
          },
        ),

        const Spacer(),
        CustomButton(
          text: "تسجيل الدخول",
          color: AppColors.black,
          horizontalPadding: 75,
          onPressed: () {},
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
