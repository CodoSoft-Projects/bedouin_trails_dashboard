import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class FilterEmployeesTypeButton extends StatelessWidget {
  const FilterEmployeesTypeButton({super.key});
  static const List<String> items = <String>[
    'كل الموظفين',
    'الموظفين الموقوفين',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomPopupMenuButton<String>(
      initialValue: items.first,
      items: items,
      itemLabelBuilder: (item) => item,
      onSelected: (value) {},
    );
  }
}
