import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class FilterTripsTypeButton extends StatelessWidget {
  const FilterTripsTypeButton({super.key});
  static const List<String> items = <String>[
    'كل الرحلات',
    'الرحلات المفتوحة',
    'الرحلات المغلقة',
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
