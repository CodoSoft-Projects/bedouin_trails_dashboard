import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/trip/gallery_model.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/empty_grid_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';
import 'trip_images_grid_view.dart';

class ShowTripImagesSection extends StatelessWidget {
  const ShowTripImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    List<GalleryModel> galleries = prov.checkGetTripDetails == null
        ? List.generate(6, (index) => GalleryModel.empty())
        : prov.selectedTrip?.galleries ?? [];
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
            ],
          ),
          const SizedBox(height: 12),
          if (galleries.isEmpty)
            EmptyGridWidget(message: S.of(context).noImagesMessage),
          if (galleries.isNotEmpty)
            TripImagesGridView(
              galleries: galleries,
              isLoading:
                  context.watch<TripsProvider>().checkGetTripDetails == null,
            ),
        ],
      ),
    );
  }
}
