import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddNewEmployeeButton extends StatelessWidget {
  const AddNewEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'اضافة موظف جديد',
      color: AppColors.blue,
      onPressed: () {},
    );
  }
}
