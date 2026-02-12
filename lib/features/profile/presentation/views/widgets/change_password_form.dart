// ignore_for_file: use_build_context_synchronously

import 'package:bedouin_trails_dashboard/core/widgets/loading_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/profile_provider.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
    return Form(
      key: prov.changePasswordFormKey,
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(height: 24),
          CustomPasswordField(
            hintText: 'كلمة المرور الحالية',
            labelText: 'كلمة المرور الحالية',
            controller: prov.currentPassword,
          ),
          CustomPasswordField(
            hintText: 'كلمة المرور الجديدة',
            labelText: 'كلمة المرور الجديدة',
            controller: prov.password,
          ),
          CustomPasswordField(
            hintText: 'تاكيد كلمة المرور',
            labelText: 'تاكيد كلمة المرور',
            controller: prov.passwordConfirmation,
          ),
          const SizedBox(height: 24),
          if (prov.checkChangingPassword == null)
            const LoadingIconWidget()
          else
            CustomButton(
              text: 'حفظ',
              color: AppColors.sandyBrown,
              horizontalPadding: 72,
              onPressed: () async {
                if (prov.password.text.trim() !=
                    prov.passwordConfirmation.text.trim()) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: 'كلمة المرور الجديدة غير متطابقة',
                  );
                  return;
                }

                if (prov.changePasswordFormKey.currentState!.validate()) {
                  await prov.changePassword();

                  if (prov.checkChangingPassword == true) {
                    Navigator.pop(context);
                    AppMessage.successBar(
                      context,
                      message: prov.checkChangingPasswordMessage,
                    );
                  } else if (prov.checkChangingPassword == false) {
                    checkUnauthenticated(
                      context,
                      msg: prov.checkChangingPasswordMessage,
                    );
                    AppMessage.errorBar(
                      context,
                      message: prov.checkChangingPasswordMessage,
                    );
                  }
                }
              },
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
