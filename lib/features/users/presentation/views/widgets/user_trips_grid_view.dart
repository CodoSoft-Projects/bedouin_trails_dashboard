import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/widgets/api_error_widget.dart';
import '../../../../../core/widgets/no_trip_section.dart';
import '../../../../trips/presentation/manager/trips_provider.dart';
import '../../../../trips/presentation/views/widgets/trip_card.dart';
import '../../manager/users_provider.dart';
import '../user_trip_details_view.dart';

class UserTripsGridView extends StatelessWidget {
  const UserTripsGridView({super.key, required this.orderStatus});
  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UsersProvider>();
    List<TripModel> loadingItem = List.generate(
      5,
      (index) => TripModel.empty(),
    );

    List<TripModel> trips = prov.checkGettingUserTrips == null
        ? loadingItem
        : prov.filterUserTripsByStatus(orderStatus);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var crossAxisCount = (width / 333).toInt();
          return prov.checkGettingUserTrips == false
              ? ApiErrorView(msg: prov.message, onRetry: prov.getUserTrips)
              : trips.isEmpty
              ? NoTripSection(showDesc: false)
              : Skeletonizer(
                  enabled: prov.checkGettingUserTrips == null,
                  child: GridView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
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
                          context.read<TripsProvider>().onSelectTrip(
                            trips[index],
                          );
                          Navigator.of(
                            context,
                          ).pushNamed(UserTripDetailsView.routeName);
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
