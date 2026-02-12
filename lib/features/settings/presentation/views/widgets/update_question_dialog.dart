import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Future<dynamic> updateQuestionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 500,
        title: 'تعديل بيانات السؤال',
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
          controller: TextEditingController(
            text: 'ما الذي يشمله سعر الرحلة ؟!',
          ),
        ),

        CustomTextFormField(
          labelText: 'الإجابة',
          hintText: 'الإجابة',
          lines: 7,
          controller: TextEditingController(
            text:
                'رحلتك تشمل النقل بسيارات الدفع الرباعي، مرشدين محترفين، التخييم، وبعض الأنشطة الصحراوية حسب الباقة. أي تكاليف إضافية سيتم توضيحها مسبقًا',
          ),
        ),

        const SizedBox(height: 16),

        CustomButton(
          text: 'حفظ التعديلات',
          color: AppColors.sandyBrown,
          horizontalPadding: 42,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
