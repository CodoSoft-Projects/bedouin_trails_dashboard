import 'package:flutter/material.dart';

import 'trip_program_section_header.dart';

class TripProgramSection extends StatelessWidget {
  const TripProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TripProgramSectionHeader(numberOfDays: 5),
        //
      ],
    );
  }
}
