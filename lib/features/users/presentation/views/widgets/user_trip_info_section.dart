import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../trips/presentation/manager/trips_provider.dart';
import '../../../../trips/presentation/views/widgets/trip_info_form.dart';
import '../../../../trips/presentation/views/widgets/trip_program_section.dart';
import 'booking_details_section.dart';

enum _SectionType { info, program, bookingDetails }

class UserTripInfoSection extends StatefulWidget {
  const UserTripInfoSection({super.key});

  @override
  State<UserTripInfoSection> createState() => _UserTripInfoSectionState();
}

class _UserTripInfoSectionState extends State<UserTripInfoSection> {
  _SectionType sectionType = _SectionType.info;

  void toggleInfo(_SectionType val) {
    sectionType = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    TripModel trip = prov.selectedTrip!;

    return CustomWhiteBox(
      showBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'بيانات الرحلة :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
              const Spacer(),
              CustomWhiteBox(
                color: AppColors.whiteGrey,
                vPadding: 4,
                hPadding: 0,
                child: Row(
                  children: [
                    CustomButton(
                      text: 'بيانات الرحلة',
                      color: sectionType == _SectionType.info
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                      textColor: sectionType == _SectionType.info
                          ? AppColors.white
                          : AppColors.black,
                      onPressed: () => toggleInfo(_SectionType.info),
                    ),

                    CustomButton(
                      text: 'برنامج الرحلة',
                      color: sectionType == _SectionType.program
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                      textColor: sectionType == _SectionType.program
                          ? AppColors.white
                          : AppColors.black,
                      onPressed: () => toggleInfo(_SectionType.program),
                    ),

                    CustomButton(
                      text: 'تفاصيل الحجز',
                      color: sectionType == _SectionType.bookingDetails
                          ? AppColors.sandyBrown
                          : AppColors.whiteGrey,
                      textColor: sectionType == _SectionType.bookingDetails
                          ? AppColors.white
                          : AppColors.black,
                      onPressed: () => toggleInfo(_SectionType.bookingDetails),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 42),
          if (sectionType == _SectionType.info)
            TripInfoForm(canEdit: false, trip: trip),
          if (sectionType == _SectionType.program) TripProgramSection(),
          if (sectionType == _SectionType.bookingDetails)
            BookingDetailsSection(trip: trip),
        ],
      ),
    );
  }
}
