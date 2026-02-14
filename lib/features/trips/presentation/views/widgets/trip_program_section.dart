import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class TripProgramSection extends StatelessWidget {
  const TripProgramSection({super.key, required this.trip});
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TripProgramSectionHeader(numberOfDays: trip.trapDays.length),
        TripProgramDaysListView(),
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
        TripProgramListView(),
      ],
    );
  }
}
