import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../suspended_trip_details_view.dart';
import 'trip_card.dart';

class SuspendedTripsGridView extends StatelessWidget {
  const SuspendedTripsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 333).toInt();
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: max(crossAxisCount, 1),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 336 / 572,
              mainAxisExtent: 500,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              return TripCard(
                trip: TripModel.empty(),
                onTripTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(SuspendedTripDetailsView.routeName);
                },
              );
            },
          );
        },
      ),
    );
  }
}
