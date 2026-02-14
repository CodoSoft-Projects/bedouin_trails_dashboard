import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import 'no_trip_day_added.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class TripProgramSection extends StatefulWidget {
  const TripProgramSection({super.key, required this.trip});
  final TripModel trip;

  @override
  State<TripProgramSection> createState() => _TripProgramSectionState();
}

class _TripProgramSectionState extends State<TripProgramSection> {
  late int selectedDay;
  late bool hasDays;

  @override
  void initState() {
    super.initState();
    selectedDay = 0;
    hasDays = widget.trip.trapDays.isNotEmpty;
  }

  void onDaySelected(int day) => setState(() => selectedDay = day);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TripProgramSectionHeader(numberOfDays: widget.trip.trapDays.length),
        if (!hasDays) NoTripDayAdded(),
        if (hasDays) ...[
          TripProgramDaysListView(
            onDaySelected: (value) {
              onDaySelected(value);
            },
            trapDays: widget.trip.trapDays,
          ),
          Row(
            children: [
              Text(
                'بطاقات البرنامج :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaLightFontFamily),
              ),
            ],
          ),
          TripProgramListView(cards: widget.trip.trapDays[selectedDay].cards),
        ],
      ],
    );
  }
}
