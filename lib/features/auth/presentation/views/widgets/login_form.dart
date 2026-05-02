// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../generated/l10n.dart';
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
          CustomEmailField(
            hintText: S.of(context).email,
            controller: prov.emailController,
          ),
          CustomPasswordField(
            hintText: S.of(context).password,
            controller: prov.passwordController,
          ),

          const SizedBox(height: 32),
          CustomTextButton(
            title: S.of(context).forgot_password,
            onTap: () {
              Navigator.pushNamed(context, ForgetPasswordView.routeName);
            },
          ),

          const Spacer(),
          CustomButton(
            text: S.of(context).login,
            color: AppColors.black,
            horizontalPadding: 75,
            onPressed: () async {
              // Navigator.pushNamed(context, DashboardView.routeName);

              if (prov.formKey.currentState!.validate()) {
                await prov.login();

                if (prov.checkLogin == true) {
                  Navigator.pushNamed(context, DashboardView.routeName);
                  // AppMessage.successBar(
                  //   context,
                  //   message: S.of(context).code_sent,
                  // );
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
