import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import 'add_new_cart_dialog.dart';
import 'trip_program_days_list_view.dart';
import 'trip_program_list_view.dart';
import 'trip_program_section_header.dart';

class UpdateTripProgramSection extends StatelessWidget {
  const UpdateTripProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(child: TripProgramSectionHeader(numberOfDays: 5)),

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
        TripProgramDaysListView(),
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
                addNewCartDialog(context);
              },
            ),
          ],
        ),
        TripProgramListView(canEdit: true),
      ],
    );
  }

}
