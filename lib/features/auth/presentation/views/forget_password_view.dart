// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/app_message.dart';
import '../manager/auth_provider.dart';
import 'widgets/forget_password_view_body.dart';
import 'widgets/reset_password_view_body.dart';
import 'widgets/verify_otp_view_body.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forget-password';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goNext() => pageController.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.bounceIn,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Builder(
        builder: (context) {
          var prov = context.watch<AuthProvider>();

          return Scaffold(
            // body: ForgetPasswordViewBody(onTap: () {}),
            body: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ForgetPasswordViewBody(onTap: () => forgetPassword(prov)),
                VerifyOtpViewBody(onTap: goNext),
                ResetPasswordViewBody(onTap: () {}),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> forgetPassword(AuthProvider prov) async {
    if (prov.forgetFormKey.currentState!.validate()) {
      await prov.forgetPassword();

      if (prov.checkForgetPassword == true) {
        goNext();
      } else if (prov.checkForgetPassword == false) {
        AppMessage.errorBar(context, message: prov.message);
      }
    }
  }
}
