import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/trip/trip_day_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../manager/trips_provider.dart' show TripsProvider;
import 'trip_program_day_item.dart';

class TripProgramDaysListView extends StatefulWidget {
  const TripProgramDaysListView({
    super.key,
    required this.trapDays,
    required this.onDaySelected,
  });
  final List<TripDayModel> trapDays;
  final ValueChanged<int> onDaySelected;

  @override
  State<TripProgramDaysListView> createState() =>
      _TripProgramDaysListViewState();
}

class _TripProgramDaysListViewState extends State<TripProgramDaysListView> {
  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  itemCount: widget.trapDays.length,
                  itemBuilder: (_, index) => TripProgramDayItem(
                    dayNum: index + 1,
                    isSelected: index + 1 == selectedDay,
                    onTap: () {
                      setState(() => selectedDay = index + 1);
                      widget.onDaySelected(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
