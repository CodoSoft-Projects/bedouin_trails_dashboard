import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'trip_program_day_item.dart';

class TripProgramDaysListView extends StatefulWidget {
  const TripProgramDaysListView({super.key});

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
            child: CustomWhiteBox(
              vPadding: 0,
              color: AppColors.whiteGrey,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) => TripProgramDayItem(
                  dayNum: index + 1,
                  isSelected: index + 1 == selectedDay,
                  onTap: () => setState(() => selectedDay = index + 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
