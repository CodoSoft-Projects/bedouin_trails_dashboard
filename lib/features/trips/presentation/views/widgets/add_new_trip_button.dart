import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddNewTripButton extends StatelessWidget {
  const AddNewTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'اضافة رحلة جديدة',
      color: AppColors.blue,
      onPressed: () {},
    );
  }
}
