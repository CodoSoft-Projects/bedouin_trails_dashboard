import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../generated/l10n.dart';
import 'trip_info_form.dart';
import 'trip_program_section.dart';

class ShowTripInfoSection extends StatefulWidget {
  const ShowTripInfoSection({super.key, required this.trip});
  final TripModel trip;

  @override
  State<ShowTripInfoSection> createState() => _ShowTripInfoSectionState();
}

class _ShowTripInfoSectionState extends State<ShowTripInfoSection> {
  bool showInfo = true;

  void toggleInfo(bool val) {
    showInfo = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      showBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).tripData,
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
              const Spacer(),
              CustomWhiteBox(
                color: AppColors.whiteGrey,
                vPadding: 0,
                hPadding: 0,
                child: Row(
                  children: [
                    CustomButton(
                      text: S.of(context).tripData,
                      color: showInfo
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                      textColor: showInfo ? AppColors.white : AppColors.black,
                      onPressed: () => toggleInfo(true),
                    ),

                    CustomButton(
                      text: S.of(context).tripProgram,
                      color: !showInfo
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                      textColor: !showInfo ? AppColors.white : AppColors.black,
                      onPressed: () => toggleInfo(false),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 42),
          if (showInfo)
            TripInfoForm(trip: widget.trip, canEdit: false)
          else
            TripProgramSection(),
        ],
      ),
    );
  }
}
