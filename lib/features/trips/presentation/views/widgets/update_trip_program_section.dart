// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/trip_day_model.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';
import 'add_new_trip_program_cart_dialog.dart';
import 'no_trip_day_added.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class UpdateTripProgramSection extends StatelessWidget {
  const UpdateTripProgramSection({super.key, required this.trip});
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    TripModel trip = prov.selectedTrip!;
    bool hasDays = trip.trapDays.isNotEmpty;
    int selectedDay = prov.selectedDay;
    TripDayModel? day = !hasDays ? null : trip.trapDays[selectedDay];

    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TripProgramSectionHeader(
                numberOfDays: trip.trapDays.length,
              ),
            ),

            CustomCircularButton(
              icon: Icons.add,
              size: 18,
              borderSide: BorderSide.none,
              backgroundColor: AppColors.whiteGrey,
              onPressed: () => _adddNewDay(context, prov: prov),
            ),
            if (hasDays)
              CustomCircularButton(
                icon: LucideIcons.trash2,
                size: 18,
                borderSide: BorderSide.none,
                backgroundColor: AppColors.phosphorBlue,
                onPressed: () {
                  DialogHelper.showQuestionDialog(
                    context,
                    title: S.of(context).deleteDay,
                    desc: S.of(context).confirmDeleteDay,
                    onOk: () => _deleteDay(context, id: day!.id, prov: prov),
                    onCancel: () {},
                  );
                },
              ),
          ],
        ),
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
              const Spacer(),

              CustomButton(
                text: S.of(context).addCard,
                color: AppColors.sandyBrown,
                onPressed: () {
                  context.read<TripsProvider>().clearCartControllers();
                  addNewTripProgramCartDialog(
                    context,
                    nextCardIdx: trip.trapDays[selectedDay].cards.length + 1,
                    day: trip.trapDays[selectedDay],
                  );
                },
              ),
            ],
          ),
          // if (selectedDay > 0)
          TripProgramListView(
            canEdit: true,
            cards: trip.trapDays[selectedDay].cards,
          ),
        ],
      ],
    );
  }

  Future<void> _adddNewDay(
    BuildContext context, {
    required TripsProvider prov,
  }) async {
    //* Show loading dialog
    loadingDialog(context);

    await prov.addTripProgramDay(tripId: trip.id);

    //* Close loading dialog
    Navigator.pop(context);

    if (prov.checkAddingDay == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkAddingDay == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }

  Future<void> _deleteDay(
    BuildContext context, {
    required int id,
    required TripsProvider prov,
  }) async {
    //* Show loading dialog
    loadingDialog(context);
    await prov.deleteTripProgramDay(id: id);

    //* Close loading dialog
    Navigator.pop(context);

    if (prov.checkDeletingDay == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkDeletingDay == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}
