import 'package:flutter/material.dart';

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
    return Scaffold(
      // body: ForgetPasswordViewBody(onTap: () {}),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ForgetPasswordViewBody(onTap: goNext),
          VerifyOtpViewBody(onTap: goNext),
          ResetPasswordViewBody(onTap: () {}),
        ],
      ),
    );
  }
}
