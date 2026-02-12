import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Future<dynamic> addQuestionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 500,
        title: 'إضافة سؤال جديد',
        content: _Form(),
      );
    },
  );
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const SizedBox(width: 500),

        CustomTextFormField(
          labelText: 'السؤال',
          hintText: 'السؤال',
          //
        ),

        CustomTextFormField(
          labelText: 'الإجابة',
          hintText: 'الإجابة',
          lines: 7,
        ),

        const SizedBox(height: 16),

        CustomButton(
          text: 'حفظ',
          color: AppColors.sandyBrown,
          horizontalPadding: 72,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
