// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';
import 'uploading_trip_images_box.dart' show UploadingTripImagesBox;

Future<dynamic> addImagesForTripDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'إضافة صور للرحلة',
        content: _Content(),
      );
    },
  );
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return Column(
      spacing: 16,
      children: [
        UploadingTripImagesBox(),
        const SizedBox(),
        CustomButton(
          text: 'موافق',
          horizontalPadding: 42,
          color: AppColors.sandyBrown,
          onPressed: () async {
            if (prov.tripImages.isNotEmpty) {
              //* show loading dialog
              loadingDialog(context);

              await prov.updateTripImages();

              //* close loading dialog
              Navigator.pop(context);
              if (prov.checkUpdateTrip == true) {
                //* close dialog
                Navigator.pop(context);

                AppMessage.successBar(context, message: prov.message);
              } else if (prov.checkUpdateTrip == false) {
                DialogHelper.showErrorDialog(
                  context,
                  title: S.of(context).error,
                  desc: prov.message,
                );
              }
            }
          },
        ),
        const SizedBox(),
      ],
    );
  }
}
