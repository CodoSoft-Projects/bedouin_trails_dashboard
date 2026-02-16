import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../../data/enums/filter_employee_type.dart';

class FilterEmployeesTypeButton extends StatelessWidget {
  const FilterEmployeesTypeButton({super.key});
  static const List<FilterEmployeeType> items = FilterEmployeeType.values;
  
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenuButton<FilterEmployeeType>(
      initialValue: items.first,
      items: items,
      itemLabelBuilder: (item) => item.arName,
      onSelected: (idx) {},
    );
  }
}
