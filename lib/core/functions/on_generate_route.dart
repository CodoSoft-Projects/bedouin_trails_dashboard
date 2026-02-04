import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    // case VerifyOtpView.routeName:
    //   return MaterialPageRoute(builder: (_) => const VerifyOtpView());
    // case ResetPasswordView.routeName:
    //   return MaterialPageRoute(builder: (_) => const ResetPasswordView());
    // case RegisterView.routeName:
    //   return MaterialPageRoute(builder: (_) => const RegisterView());
    // case Register2PasswordView.routeName:
    //   return MaterialPageRoute(builder: (_) => const Register2PasswordView());

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
