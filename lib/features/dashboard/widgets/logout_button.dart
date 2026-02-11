// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../core/functions/check_unauthenticated.dart';
import '../../../core/helpers/app_message.dart';
import '../../../core/helpers/dialog_helper.dart';
import '../../../core/providers/logout_provider.dart';
import '../../auth/presentation/views/login_view.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LogoutProvider(),
      child: _Button(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Consumer<LogoutProvider>(
      builder: (context, provider, child) {
        return MaterialButton(
          onPressed: () {
            DialogHelper.showQuestionDialog(
              context,
              title: 'تسجيل الخروج',
              desc: 'هل ترغب في تسجيل الخروج من التطبيق؟',
              btnOkText: 'نعم',
              btnCancelText: 'لا',
              onCancel: () {},
              onOk: () async {
                await provider.logout();

                if (provider.checkLogin == true) {
                  AppMessage.successBar(context, message: provider.message);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginView.routeName,
                    (_) => false,
                  );
                } else if (provider.checkLogin == false) {
                  var isUnauthenticated = checkUnauthenticated(
                    context,
                    msg: provider.message,
                  );
                  if (!isUnauthenticated) {
                    AppMessage.errorBar(context, message: provider.message);
                  }
                }
              },
            );
          },
          padding: const EdgeInsets.all(4.0),
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Spacer(),
              Center(
                child: Text(
                  'تسجيل الخروج',
                  style: AppTextStyles.regular16(context),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.sandyBrown,
                ),
                child: Icon(
                  LucideIcons.logOut,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
      },
    );
  }
}
