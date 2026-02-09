import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../trips/presentation/views/widgets/trip_card.dart';
import '../user_trip_details_view.dart';

class UserTripsGridView extends StatelessWidget {
  const UserTripsGridView({super.key});

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
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: max(crossAxisCount, 1),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 336 / 572,
              mainAxisExtent: 500,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return TripCard(
                onTripTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(UserTripDetailsView.routeName);
                },
              );
            },
          );
        },
      ),
    );
  }
}
