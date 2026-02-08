import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import 'uploading_trip_images_box.dart' show UploadingTripImagesBox;

Future<dynamic> addImagesForTripDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'إضافة صور للرحلة',
        content: Column(
          spacing: 16,
          children: [
            UploadingTripImagesBox(),
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
