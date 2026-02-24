import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/filter_employee_type.dart';
import '../../manager/employees_provider.dart';

class FilterEmployeesTypeButton extends StatelessWidget {
  const FilterEmployeesTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<EmployeesProvider>();
    const List<FilterEmployeeType> items = FilterEmployeeType.values;
    return CustomPopupMenuButton<FilterEmployeeType>(
      initialValue: prov.filter,
      items: items,
      itemLabelBuilder: (item) => item.label(context),
      onSelected: (idx) {
        log("Selected: ${items[idx]}");
        prov.onChangeFilter(items[idx]);
      },
    );
  }
}
