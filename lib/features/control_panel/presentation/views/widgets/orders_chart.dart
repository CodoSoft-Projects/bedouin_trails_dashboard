import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

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
          value: 0.50,
          radius: currentIndex == 0 ? chartWidth + 10 : chartWidth,
          showTitle: false,
        ),
        // title: OrderStatus.pending.label(context),
        PieChartSectionData(
          color: AppColors.cyanYellow,
          value: 0.40,
          radius: currentIndex == 1 ? chartWidth + 10 : chartWidth,
          showTitle: false,
        ),
        // title: OrderStatus.cancelled.label(context),
        PieChartSectionData(
          color: AppColors.red,
          value: 0.15,
          radius: currentIndex == 2 ? chartWidth + 10 : chartWidth,
          showTitle: false,
        ),
        // title: OrderStatus.payed.label(context),
        PieChartSectionData(
          color: AppColors.cyanGreen,
          value: 0.35,
          radius: currentIndex == 3 ? chartWidth + 10 : chartWidth,
          showTitle: false,
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
                    Text("143", style: AppTextStyles.bold18(context)),
                    Text('حجز', style: AppTextStyles.semiBold20(context)),
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
