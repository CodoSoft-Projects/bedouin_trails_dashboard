import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/auth_provider.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var prov = context.read<AuthProvider>();
    return Form(
      key: prov.forgetFormKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomEmailField(
            hintText: S.of(context).email,
            controller: prov.forgetEmailController,
          ),
          const Spacer(),
          CustomButton(
            text: S.of(context).send,
            horizontalPadding: 75,
            color: AppColors.black,
            onPressed: onTap,
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
