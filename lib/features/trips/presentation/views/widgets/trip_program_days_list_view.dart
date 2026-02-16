import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../manager/trips_provider.dart';
import 'trip_program_day_item.dart';

class TripProgramDaysListView extends StatefulWidget {
  const TripProgramDaysListView({super.key});

  @override
  State<TripProgramDaysListView> createState() =>
      _TripProgramDaysListViewState();
}

class _TripProgramDaysListViewState extends State<TripProgramDaysListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TripsProvider>(
      builder: (_, prov, _) => SizedBox(
        height: 140,
        child: Row(
          children: [
            Expanded(
              child: Skeletonizer(
                enabled:
                    context.watch<TripsProvider>().checkGetTripDetails == null,
                child: CustomWhiteBox(
                  vPadding: 0,
                  color: AppColors.whiteGrey,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: prov.selectedTrip!.trapDays.length,
                    itemBuilder: (_, index) => TripProgramDayItem(
                      dayNum: prov.selectedTrip!.trapDays[index].dayNumber,
                      isSelected: index == prov.selectedDay,
                      onTap: () {
                        prov.onDaySelected(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
