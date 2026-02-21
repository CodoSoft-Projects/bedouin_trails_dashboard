import 'package:flutter/material.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import 'order_chart_list_tile.dart';
import 'orders_chart.dart';

class OrdersChartSection extends StatelessWidget {
  const OrdersChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: CustomWhiteBox(
        showBorder: true,
        child: Column(
          children: [
            OrdersChart(),
            const SizedBox(height: 12),
            OrderChartListTile(
              title: OrderStatus.accepted.label(context),
              leadingColor: AppColors.chartGrey,
            ),
            OrderChartListTile(
              title: OrderStatus.payed.label(context),
              leadingColor: AppColors.cyanGreen,
            ),
            OrderChartListTile(
              title: OrderStatus.pending.label(context),
              leadingColor: AppColors.cyanYellow,
            ),
            OrderChartListTile(
              title: OrderStatus.cancelled.label(context),
              leadingColor: AppColors.red,
            ),
          ],
        ),
      ),
    );
  }
}
