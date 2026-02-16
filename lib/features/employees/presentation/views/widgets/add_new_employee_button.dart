import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/employees_provider.dart';
import '../new_employee_view.dart';

class AddNewEmployeeButton extends StatelessWidget {
  const AddNewEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'اضافة موظف جديد',
      color: AppColors.blue,
      onPressed: () {
        context.read<EmployeesProvider>().clearEmployeeData();
        Navigator.pushNamed(context, NewEmployeeView.routeName);
      },
    );
  }
}
