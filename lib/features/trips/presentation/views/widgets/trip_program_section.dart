import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../manager/trips_provider.dart';
import 'no_trip_day_added.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class TripProgramSection extends StatefulWidget {
  const TripProgramSection({super.key});

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
  }

  void onDaySelected(int day) => setState(() => selectedDay = day);

  @override
  Widget build(BuildContext context) {
    var trip = context.watch<TripsProvider>().selectedTrip!;
    hasDays = trip.trapDays.isNotEmpty;
    return Column(
      spacing: 12,
      children: [
        TripProgramSectionHeader(numberOfDays: trip.trapDays.length),
        if (!hasDays) NoTripDayAdded(),
        if (hasDays) ...[
          TripProgramDaysListView(
            onDaySelected: (value) {
              onDaySelected(value);
            },
            trapDays: trip.trapDays,
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
          TripProgramListView(cards: trip.trapDays[selectedDay].cards),
        ],
      ],
    );
  }
}
