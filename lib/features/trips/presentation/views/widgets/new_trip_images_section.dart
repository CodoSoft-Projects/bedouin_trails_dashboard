import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';

class NewTripImagesSection extends StatelessWidget {
  const NewTripImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      showBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'صور الرحلة :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
              const Spacer(),

              CustomButton(
                text: 'إضافة صورة',
                color: AppColors.sandyBrown,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          EmptyGridWidget(
            message:
                'لا توجد صور مضافة حاليًا 📷\nقم بإضافة صور للرحلة لعرضها للمستخدمين بشكل أفضل',
          ),
          // TripImagesGridView(cnaEdit:true),
        ],
      ),
    );
  }
}
