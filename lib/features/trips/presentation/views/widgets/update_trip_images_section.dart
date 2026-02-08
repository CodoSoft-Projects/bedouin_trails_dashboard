import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'add_images_for_trip_dialog.dart';
import 'trip_images_grid_view.dart';

class UpdateTripImagesSection extends StatelessWidget {
  const UpdateTripImagesSection({super.key});

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
                onPressed: () {
                  addImagesForTripDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // EmptyGridWidget(
          //   message:
          //       'لا توجد صور مضافة حاليًا 📷\nقم بإضافة صور للرحلة لعرضها للمستخدمين بشكل أفضل',
          // ),
          TripImagesGridView(canEdit: true),
        ],
      ),
    );
  }
}
