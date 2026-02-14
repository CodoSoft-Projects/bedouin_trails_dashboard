import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/trip/trip_model.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/trips_provider.dart';
import 'widgets/update_trip_images_section.dart';
import 'widgets/update_trip_info_section.dart';

class UpdateTripView extends StatelessWidget {
  const UpdateTripView({super.key});
  static const routeName = '/update-trip-view';

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
    TripModel trip = context.watch<TripsProvider>().selectedTrip!;
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'تعديل تفاصيل الرحلة',
        showBack: true,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: isMobile ? _Mobile(trip) : _Desktop(trip),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
        ],
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop(this.trip);
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: UpdateTripImagesSection(trip: trip)),
        Expanded(child: UpdateTripInfoSection(trip: trip)),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile(this.trip);
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        UpdateTripImagesSection(trip: trip),
        UpdateTripInfoSection(trip: trip),
      ],
    );
  }
}
