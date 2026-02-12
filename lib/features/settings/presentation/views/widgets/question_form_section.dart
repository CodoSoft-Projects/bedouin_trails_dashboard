import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class QuestionFormSection extends StatelessWidget {
  const QuestionFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  'بيانات عرض السؤال :',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular24(
                    context,
                  ).copyWith(fontFamily: Constants.vexaFontFamily),
                ),
              ),

              const Spacer(),

              CustomCircularButton(
                backgroundColor: AppColors.whiteGrey,
                icon: LucideIcons.squarePen,
                borderSide: BorderSide.none,
                size: 18,
                onPressed: () {},
              ),

              CustomCircularButton(
                backgroundColor: AppColors.whiteGrey,
                icon: LucideIcons.trash2,
                borderSide: BorderSide.none,
                size: 18,
                onPressed: () {
                  DialogHelper.showQuestionDialog(
                    context,
                    title: 'تاكيد',
                    desc: 'هل تريد حذف هذا السؤال؟',
                    onCancel: () {},
                    onOk: () {
                      DialogHelper.showSuccessDialog(
                        context,
                        title: 'تم حذف السؤال بنجاح',
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          _QuestionForm(),
        ],
      ),
    );
  }
}

class _QuestionForm extends StatelessWidget {
  const _QuestionForm();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AbsorbPointer(
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 32),

            CustomTextFormField(
              labelText: 'السؤال',
              controller: TextEditingController(
                text: 'ما الذي يشمله سعر الرحلة ؟!',
              ),
            ),

            CustomTextFormField(
              labelText: 'الإجابة',
              lines: 7,
              controller: TextEditingController(
                text:
                    'رحلتك تشمل النقل بسيارات الدفع الرباعي، مرشدين محترفين، التخييم، وبعض الأنشطة الصحراوية حسب الباقة. أي تكاليف إضافية سيتم توضيحها مسبقًا',
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
