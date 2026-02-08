import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import 'update_trip_program_cart_dialog.dart';

class TripProgramCartItem extends StatelessWidget {
  const TripProgramCartItem({super.key, this.canEdit = false});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomWhiteBox(
            color: AppColors.whiteGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    CustomWhiteBox(
                      child: Text(
                        'البطاقة 01',
                        style: AppTextStyles.regular16(context),
                      ),
                    ),
                    const Spacer(),
                    if (canEdit) ...[
                      CustomCircularButton(
                        icon: LucideIcons.filePenLine,
                        borderSide: BorderSide.none,
                        size: 18,
                        onPressed: () {
                          updateTripProgramCartDialog(context);
                        },
                      ),
                      CustomCircularButton(
                        icon: LucideIcons.trash2,
                        borderSide: BorderSide.none,
                        size: 18,
                        onPressed: () {
                          DialogHelper.showQuestionDialog(
                            context,
                            title: 'تاكيد',
                            desc: 'هل تريد حذف البطاقة',
                            onCancel: () {},
                            onOk: () {
                              DialogHelper.showSuccessDialog(
                                context,
                                title: 'تم حذف البطاقة',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ],
                ),

                Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          Assets.imagesTestTripImage,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Expanded(child: _CartInfo()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CartInfo extends StatelessWidget {
  const _CartInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        _CartInfoItem(title: 'عنوان البطاقة :', subtitle: 'بداية المغامرة'),
        _CartInfoItem(
          title: 'وصف برنامج البطاقة :',
          subtitle:
              'الانطلاق صباحًا من نقطة التجمع بسيارات الدفع الرباعي، مع ترحيب وتعريف سريع بالبرنامج وتعليمات السلامة قبل دخول الصحراء. الانطلاق صباحًا من نقطة التجمع بسيارات الدفع الرباعي، مع ترحيب وتعريف سريع بالبرنامج وتعليمات السلامة قبل دخول الصحراء. الانطلاق صباحًا من نقطة التجمع بسيارات الدفع الرباعي، مع ترحيب وتعريف سريع بالبرنامج وتعليمات السلامة قبل دخول الصحراء.',
        ),
      ],
    );
  }
}

class _CartInfoItem extends StatelessWidget {
  const _CartInfoItem({required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.regular16(
            context,
          ).copyWith(color: AppColors.blue),
        ),
        Row(
          children: [
            Expanded(
              child: CustomWhiteBox(
                child: Text(subtitle, style: AppTextStyles.regular16(context)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
