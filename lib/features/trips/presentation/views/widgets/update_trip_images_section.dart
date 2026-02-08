import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'trip_image.dart';

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
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          // EmptyGridWidget(
          //   message:
          //       'لا توجد صور مضافة حاليًا 📷\nقم بإضافة صور للرحلة لعرضها للمستخدمين بشكل أفضل',
          // ),
          _ImagesGridView(),
        ],
      ),
    );
  }
}

class _ImagesGridView extends StatelessWidget {
  const _ImagesGridView();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 160).toInt();
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
            mainAxisExtent: 160,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return TripImage(canDelete: true);
          },
        );
      },
    );
  }
}
