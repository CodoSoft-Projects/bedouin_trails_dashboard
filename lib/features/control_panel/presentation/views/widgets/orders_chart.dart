import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/control_panel_provider.dart';

class OrdersChart extends StatefulWidget {
  const OrdersChart({super.key});

  @override
  State<OrdersChart> createState() => _OrdersChartState();
}

class _OrdersChartState extends State<OrdersChart> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    double chartWidth = (width * 0.015).clamp(20, 25);
    var prov = context.read<ControlPanelProvider>();
    var item = prov.controlPanelData.bookings;
    var pieChartData = PieChartData(
      sectionsSpace: 0,
      pieTouchData: PieTouchData(
        touchCallback: (p0, p1) {
          currentIndex = p1?.touchedSection?.touchedSectionIndex ?? -1;
          setState(() {});
        },
      ),
      sections: [
        // title: OrderStatus.accepted.label(context),
        PieChartSectionData(
          color: AppColors.chartGrey,
          value: item.accepted.toDouble(),
          radius: currentIndex == 0 ? chartWidth + 10 : chartWidth,
          // showTitle: false,
          title: item.accepted.toString(),
          titleStyle: AppTextStyles.medium14(context),
        ),
        // title: OrderStatus.pending.label(context),
        PieChartSectionData(
          color: AppColors.cyanYellow,
          value: item.pending.toDouble(),
          radius: currentIndex == 1 ? chartWidth + 10 : chartWidth,
          // showTitle: false,
          title: item.pending.toString(),
          titleStyle: AppTextStyles.medium14(context),
        ),
        // title: OrderStatus.cancelled.label(context),
        PieChartSectionData(
          color: AppColors.red,
          value: item.cancelled.toDouble(),
          radius: currentIndex == 2 ? chartWidth + 10 : chartWidth,
          // showTitle: false,
          title: item.cancelled.toString(),
          titleStyle: AppTextStyles.medium14(context),
        ),
        // title: OrderStatus.payed.label(context),
        PieChartSectionData(
          color: AppColors.cyanGreen,
          value: item.paid.toDouble(),
          radius: currentIndex == 3 ? chartWidth + 10 : chartWidth,
          // showTitle: false,
          title: item.paid.toString(),
          titleStyle: AppTextStyles.medium14(context),
        ),
      ],
    );
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.total.toString(),
                      style: AppTextStyles.bold18(context),
                    ),
                    Text(
                      S.of(context).booking,
                      style: AppTextStyles.semiBold20(context),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(child: PieChart(pieChartData)),
          ],
        ),
      ),
    );
  }
}
