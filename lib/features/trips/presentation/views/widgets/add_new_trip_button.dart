import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../new_trip_view.dart';

class AddNewTripButton extends StatelessWidget {
  const AddNewTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'اضافة رحلة جديدة',
      color: AppColors.blue,
      onPressed: () {
        Navigator.of(context).pushNamed(NewTripView.routeName);
      },
    );
  }
}
