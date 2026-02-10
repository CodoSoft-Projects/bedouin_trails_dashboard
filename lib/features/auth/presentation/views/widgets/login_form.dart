// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../dashboard/dashboard_view.dart';
import '../../manager/auth_provider.dart';
import '../forget_password_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AuthProvider>();
    return Form(
      key: prov.formKey,
      child: Column(
        spacing: 12,
        children: [
          CustomEmailField(controller: prov.emailController),
          CustomPasswordField(controller: prov.passwordController),

          const SizedBox(height: 32),
          CustomTextButton(
            title: 'هل نسيت كلمة المرور ؟!',
            onTap: () {
              Navigator.pushNamed(context, ForgetPasswordView.routeName);
            },
          ),

          const Spacer(),
          CustomButton(
            text: "تسجيل الدخول",
            color: AppColors.black,
            horizontalPadding: 75,
            onPressed: () async {
              // Navigator.pushNamed(context, DashboardView.routeName);

              if (prov.formKey.currentState!.validate()) {
                await prov.login();

                if (prov.checkLogin == true) {
                  Navigator.pushNamed(context, DashboardView.routeName);
                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkLogin == false) {
                  AppMessage.errorBar(context, message: prov.message);
                }
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
