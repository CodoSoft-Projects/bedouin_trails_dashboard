import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/auth_provider.dart';
import 'widgets/custom_auth_view.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login-view';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: CustomAuthView(
              isLoading: context.watch<AuthProvider>().checkLogin == null,
              image: Assets.imagesLoginImage,
              showBackIcon: false,
              showHand: true,
              title: S.of(context).login_title,
              subtitle: S.of(context).login_subtitle,
              note: S.of(context).login_note,
              form: LoginForm(),
            ),
          );
        },
      ),
    );
  }
}
