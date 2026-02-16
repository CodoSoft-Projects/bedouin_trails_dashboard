import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'new_trip_info_form.dart';

class NewTripInfoSection extends StatelessWidget {
  const NewTripInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
          const SizedBox(height: 42),
          NewTripInfoForm(),
        ],
      ),
    );
  }
}
