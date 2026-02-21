import 'dart:math';

import 'package:flutter/material.dart';

import '../../../domain/entities/panel_chart_item_entity.dart';
import 'panel_chart_item.dart';

class PanelChartsGrid extends StatelessWidget {
  const PanelChartsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 300).toInt();
        crossAxisCount = (crossAxisCount / 2).toInt() * 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.8,
            mainAxisExtent: 250,
          ),
          itemCount: panelChartItems.length,
          itemBuilder: (context, index) {
            return PanelChartItem(item: panelChartItems[index]);
          },
        );
      },
    );
  }
}
