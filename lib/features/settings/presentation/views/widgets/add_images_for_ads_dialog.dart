import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import 'uploading_ads_images_box.dart';

Future<dynamic> addImagesForAdsDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'إضافة صور للاعلان',
        content: Column(
          spacing: 16,
          children: [
            UploadingAdsImagesBox(),
            const SizedBox(),
            CustomButton(
              text: 'موافق',
              horizontalPadding: 42,
              color: AppColors.sandyBrown,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(),
          ],
        ),
      );
    },
  );
}
