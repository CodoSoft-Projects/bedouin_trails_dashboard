// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class NoTripDayAdded extends StatelessWidget {
  const NoTripDayAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.borderGrey.withOpacity(.25),
          width: 1.2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.sandyBrown.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.calendar_month_rounded,
              size: 34,
              color: AppColors.sandyBrown,
            ),
          ),

          const SizedBox(height: 18),

          /// Title
          Text(
            S.of(context).noDaysTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold18(
              context,
            ).copyWith(fontFamily: Constants.vexaLightFontFamily),
          ),

          const SizedBox(height: 8),

          /// Subtitle
          Text(
            S.of(context).noTripDaysMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular16(context).copyWith(
              color: AppColors.black2,
              fontFamily: Constants.vexaLightFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
