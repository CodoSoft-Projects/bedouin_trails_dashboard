import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/widgets/custom_popup_menu_button.dart';
import '../../manager/orders_provider.dart';

class FilterOrdersButton extends StatelessWidget {
  const FilterOrdersButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();

    return CustomPopupMenuButton<OrderStatus>(
      initialValue: prov.orderStatus,
      items: prov.orderStatuses,
      itemLabelBuilder: (item) => item.label(context),
      onSelected: (idx) {
        prov.onChangeOrderStatus(idx);
      },
    );
  }
}
