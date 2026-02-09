import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/new_employee_form.dart';

class NewEmployeeView extends StatelessWidget {
  const NewEmployeeView({super.key});
  static const routeName = '/new-employee';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'اضافة موظف جديد'),
      body: const NewEmployeeForm(),
    );
  }
}
