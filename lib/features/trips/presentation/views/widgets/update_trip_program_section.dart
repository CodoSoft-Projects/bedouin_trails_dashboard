import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../manager/trips_provider.dart';
import 'add_new_trip_program_cart_dialog.dart';
import 'no_trip_day_added.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class UpdateTripProgramSection extends StatefulWidget {
  const UpdateTripProgramSection({super.key, required this.trip});
  final TripModel trip;

  @override
  State<UpdateTripProgramSection> createState() =>
      _UpdateTripProgramSectionState();
}

class _UpdateTripProgramSectionState extends State<UpdateTripProgramSection> {
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
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TripProgramSectionHeader(
                numberOfDays: widget.trip.trapDays.length,
              ),
            ),

            CustomCircularButton(
              icon: Icons.add,
              size: 18,
              borderSide: BorderSide.none,
              backgroundColor: AppColors.whiteGrey,
              onPressed: () {},
            ),
            CustomCircularButton(
              icon: LucideIcons.trash2,
              size: 18,
              borderSide: BorderSide.none,
              backgroundColor: AppColors.phosphorBlue,
              onPressed: () {},
            ),
          ],
        ),
        if (!hasDays) NoTripDayAdded(),
        if (hasDays) ...[
          TripProgramDaysListView(
            trapDays: widget.trip.trapDays,
            onDaySelected: (int value) {
              onDaySelected(value);
            },
          ),
          Row(
            children: [
              Text(
                'بطاقات البرنامج :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaLightFontFamily),
              ),
              const Spacer(),

              CustomButton(
                text: 'إضافة بطاقة',
                color: AppColors.sandyBrown,
                onPressed: () {
                  context.read<TripsProvider>().clearCartControllers();
                  addNewTripProgramCartDialog(
                    context,
                    nextCardIdx:
                        widget.trip.trapDays[selectedDay].cards.length + 1,
                    day: widget.trip.trapDays[selectedDay],
                  );
                },
              ),
            ],
          ),
          TripProgramListView(
            canEdit: true,
            cards: widget.trip.trapDays[selectedDay].cards,
          ),
        ],
      ],
    );
  }
}
