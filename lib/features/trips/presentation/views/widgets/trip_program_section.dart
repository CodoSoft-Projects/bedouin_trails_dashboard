import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';
import 'no_trip_day_added.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class TripProgramSection extends StatelessWidget {
  const TripProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    TripModel trip = prov.selectedTrip!;
    bool hasDays = trip.trapDays.isNotEmpty;
    int selectedDay = prov.selectedDay;

    return Column(
      spacing: 12,
      children: [
        TripProgramSectionHeader(numberOfDays: trip.trapDays.length),
        if (!hasDays) NoTripDayAdded(),
        if (hasDays) ...[
          TripProgramDaysListView(),
          Row(
            children: [
              Text(
                S.of(context).programCards,
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
