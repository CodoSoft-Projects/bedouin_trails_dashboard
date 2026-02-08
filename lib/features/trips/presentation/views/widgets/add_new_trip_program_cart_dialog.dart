import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'empty_cart_image.dart';

Future<dynamic> addNewTripProgramCartDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: CustomInfoField(
                    color: AppColors.whiteGrey,
                    title: 'اليوم',
                    subtitle: '1',
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: CustomInfoField(
                    color: AppColors.whiteGrey,
                    title: 'البطاقة',
                    subtitle: '5',
                  ),
                ),
              ],
            ),
            SizedBox(width: 700, height: 16),
            Row(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Column(
                      children: [
                        const Expanded(child: EmptyCartImage()),
                        Row(
                          children: [
                            CustomCircularButton(
                              icon: LucideIcons.upload,
                              backgroundColor: AppColors.whiteGrey,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 3, child: NewCartForm()),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class NewCartForm extends StatelessWidget {
  const NewCartForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 8,
        children: [
          const _BlueLable(lable: 'عنوان البطاقة :'),
          CustomTextFormField(hintText: 'العنوان'),

          const _BlueLable(lable: 'وصف برنامج البطاقة :'),
          CustomTextFormField(hintText: 'الوصف', lines: 8),

          const SizedBox(height: 16),
          CustomButton(
            text: 'حفظ',
            horizontalPadding: 75,
            color: AppColors.sandyBrown,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _BlueLable extends StatelessWidget {
  const _BlueLable({required this.lable});
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lable,
          style: AppTextStyles.regular16(
            context,
          ).copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}
