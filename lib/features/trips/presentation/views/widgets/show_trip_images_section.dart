import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'trip_images_grid_view.dart';

class ShowTripImagesSection extends StatelessWidget {
  const ShowTripImagesSection({super.key});

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
            ],
          ),
          const SizedBox(height: 12),
          TripImagesGridView(),
        ],
      ),
    );
  }
}
