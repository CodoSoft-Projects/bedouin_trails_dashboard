import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'uploading_trip_images_box.dart';

class NewTripImagesSection extends StatelessWidget {
  const NewTripImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      showBorder: true,
      vPadding: 0,
      hPadding: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'صور الرحلة :',
                  style: AppTextStyles.regular24(
                    context,
                  ).copyWith(fontFamily: Constants.vexaFontFamily),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(children: [Expanded(child: UploadingTripImagesBox())]),
        ],
      ),
    );
  }
}
