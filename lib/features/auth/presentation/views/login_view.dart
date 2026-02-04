import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'widgets/custom_auth_view.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthView(
        image: Assets.imagesLoginImage,
        showBackIcon: false,
        showHand: true,
        title: 'أهلا بك .. جاهز للمغامرة',
        subtitle:
            'سجّل دخولك علشان تستعرض رحلات السفاري، تحجز مغامرتك، وتدير حجوزاتك بكل سهولة.',
        note:
            'سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية',
        form: LoginForm(),
      ),
    );
  }
}
