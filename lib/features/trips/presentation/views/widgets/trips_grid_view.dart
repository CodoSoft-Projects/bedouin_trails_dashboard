import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../manager/trips_provider.dart';
import '../trip_details_view.dart';
import 'trip_card.dart';

class TripsGridView extends StatelessWidget {
  const TripsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    List<TripModel> trips = prov.checkGetAllActiveTrips == null
        ? List.generate(6, (index) => TripModel.empty())
        : prov.trips;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 333).toInt();
          return Skeletonizer(
            enabled: prov.checkGetAllActiveTrips == null,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: max(crossAxisCount, 1),
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 336 / 572,
                mainAxisExtent: 500,
              ),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return TripCard(
                  trip: trips[index],
                  onTripTap: () {
                    prov.onSelectTrip(trips[index]);
                    Navigator.of(context).pushNamed(TripDetailsView.routeName);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
