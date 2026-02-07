import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'trip_card_image.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 8,
        children: [
          Expanded(child: TripCardImage()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'واحة سيوة',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.regular16(context),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(Assets.imagesCamelCircle),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'الشيخ زويد',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.regular16(context),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomWhiteBox(
                        child: Center(
                          child: Text(
                            '4 أيام',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular16(context),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: CustomWhiteBox(
                        child: Center(
                          child: Text(
                            '20 شخص',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular16(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'عرض التفاصيل',
                        color: AppColors.sandyBrown,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
