import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Future<dynamic> addArticleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'إضافة مقالة جديدة',
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
        const SizedBox(width: 600),
        AspectRatio(
          aspectRatio: 584 / 264,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Column(
              children: [
                const Spacer(),
                Text(
                  'صورة المقالة',
                  style: AppTextStyles.regular18(
                    context,
                  ).copyWith(color: AppColors.blue),
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomCircularButton(
                      icon: LucideIcons.upload,
                      size: 18,
                      borderSide: BorderSide.none,
                      backgroundColor: AppColors.whiteGrey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        CustomTextFormField(
          labelText: 'عنوان المقالة',
          hintText: 'عنوان المقالة',
        ),

        CustomTextFormField(
          labelText: 'محتوي المقالة',
          hintText: 'محتوي المقالة',
          lines: 10,
          //
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
