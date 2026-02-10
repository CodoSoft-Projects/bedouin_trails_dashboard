import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/helpers/dialog_helper.dart';

class BlockEmployeeButton extends StatelessWidget {
  const BlockEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'حظر الموظف',
      color: AppColors.red,
      onPressed: () {
        DialogHelper.showQuestionDialog(
          context,
          title: 'حظر الموظف',
          desc: 'هل انت متاكد من حظر الموظف ؟',
          onCancel: () {},
          onOk: () {
            Navigator.pop(context);

            DialogHelper.showSuccessDialog(
              context,
              title: 'تم حظر المقدم بنجاح',
            );
          },
        );
      },
    );
  }
}
