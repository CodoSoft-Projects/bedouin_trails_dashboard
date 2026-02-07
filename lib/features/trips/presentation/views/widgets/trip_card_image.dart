import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_white_box.dart';

class TripCardImage extends StatelessWidget {
  const TripCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 24,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(Assets.imagesTestTripImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),

        Positioned(
          left: 16,
          right: 16,
          bottom: 0,
          child: CustomWhiteBox(
            vPadding: 8,
            child: Center(
              child: Text(
                'SIWA SAFARI TOUR',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular20(context),
              ),
            ),
          ),
        ),

        Positioned(
          right: 8,
          top: 8,
          child: CustomWhiteBox(
            hPadding: 8,
            vPadding: 4,
            child: Row(
              spacing: 6,
              children: [
                Icon(Icons.star, size: 14, color: AppColors.cyanYellow),
                Text('3.2', style: AppTextStyles.regular20(context)),
              ],
            ),
          ),
        ),

        /// ChatGPT : Edit only this widget
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
              color: AppColors.whiteGrey,
            ),
            child: Row(
              spacing: 12,
              children: [
                Icon(Icons.attach_money, color: AppColors.cyanGreen),
                Text('300', style: AppTextStyles.regular24(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
