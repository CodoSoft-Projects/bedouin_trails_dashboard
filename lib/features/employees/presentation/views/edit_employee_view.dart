import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class EmployeeDetailsView extends StatelessWidget {
  const EmployeeDetailsView({super.key});
  static const routeName = '/edit-employee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'بيانات الموظف'),
      body: Center(),
    );
  }
}
