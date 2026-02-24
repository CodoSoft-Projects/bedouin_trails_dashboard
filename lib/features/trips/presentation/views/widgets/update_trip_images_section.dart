import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../../../../generated/l10n.dart';
import 'add_images_for_trip_dialog.dart';
import 'trip_images_grid_view.dart';

class UpdateTripImagesSection extends StatelessWidget {
  const UpdateTripImagesSection({super.key, required this.trip});
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      showBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).tripImages,
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
              const Spacer(),

              CustomButton(
                text: S.of(context).addImage,
                color: AppColors.sandyBrown,
                onPressed: () {
                  addImagesForTripDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (trip.galleries.isEmpty)
            EmptyGridWidget(message: S.of(context).noImagesMessage),
          if (trip.galleries.isNotEmpty)
            TripImagesGridView(canEdit: true, galleries: trip.galleries),
        ],
      ),
    );
  }
}
