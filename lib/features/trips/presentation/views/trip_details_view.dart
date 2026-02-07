import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/show_trip_images_section.dart';
import 'widgets/trip_details_view_header.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});
  static const routeName = '/trip-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'تفاصيل الرحلة', showBack: true),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const TripDetailsViewHeader(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                spacing: 12,
                children: [
                  Expanded(child: ShowTripImagesSection()),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
