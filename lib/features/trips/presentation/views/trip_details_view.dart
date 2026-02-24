import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/enums/trip_status.dart';
import '../../../../core/models/trip/trip_model.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../manager/trips_provider.dart';
import 'widgets/show_trip_images_section.dart';
import 'widgets/show_trip_info_section.dart';
import 'widgets/suspended_trip_details_view_header.dart';
import 'widgets/trip_details_view_header.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});
  static const routeName = '/trip-details';

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
    var prov = context.watch<TripsProvider>();
    TripModel trip = prov.selectedTrip!;
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).tripDetails,
        showBack: true,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          if (trip.status == TripStatus.active)
            TripDetailsViewHeader(trip: trip),
          if (trip.status == TripStatus.inactive)
            SuspendedTripDetailsViewHeader(trip: trip),

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
        Expanded(child: ShowTripImagesSection()),
        Expanded(child: ShowTripInfoSection(trip: trip)),
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
        ShowTripImagesSection(),
        ShowTripInfoSection(trip: trip),
      ],
    );
  }
}
