import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_popup_menu_button.dart';

class FilterTripsDurationButton extends StatelessWidget {
  const FilterTripsDurationButton({super.key});
  static const List<String> items = <String>[
    '1 day',
    '2 days',
    '3 days',
    '4 days',
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
