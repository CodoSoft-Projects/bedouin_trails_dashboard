import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../../generated/l10n.dart';

class TripProgramSectionHeader extends StatelessWidget {
  const TripProgramSectionHeader({super.key, required this.numberOfDays});
  final int numberOfDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "أيام الرحلة :",
          style: AppTextStyles.regular24(
            context,
          ).copyWith(fontFamily: Constants.vexaLightFontFamily),
        ),
        const Spacer(),
        SizedBox(
          width: 150,
          child: CustomInfoField(
            color: AppColors.babyBlue,
            title: 'رحلة :',
            subtitle: S.of(context).days(numberOfDays),
          ),
        ),
      ],
    );
  }
}
