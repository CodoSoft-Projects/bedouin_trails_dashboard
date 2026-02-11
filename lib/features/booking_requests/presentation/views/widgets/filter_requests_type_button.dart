import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class FilterRequestsTypeButton extends StatelessWidget {
  const FilterRequestsTypeButton({super.key});
  static const List<String> items = <String>[
    'كل الحجوزات',
    'حجوزات معلقة',
    'حجوزات مدفوعة',
    'حجوزات مكتملة',
    'حجوزات ملغاة',
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
