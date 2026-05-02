import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/entities/panel_header_entity.dart';
import '../../manager/control_panel_provider.dart';
import 'panel_header_item.dart';

class PanelHeaderGrid extends StatelessWidget {
  const PanelHeaderGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ControlPanelProvider>();
    var items = panelHeadersList(
      context: context,
      newBookings: prov.controlPanelData.todayBookings,
      users: prov.controlPanelData.usersCount,
      articles: prov.controlPanelData.articlesCount,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 250).toInt();
        crossAxisCount = (crossAxisCount / 3).toInt() * 3;

        return Skeletonizer(
          enabled: prov.checkGetting == null,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: max(crossAxisCount, 1),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 1,
              mainAxisExtent: 160,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return PanelHeaderItem(panelHeaderEntity: items[index]);
            },
          ),
        );
      },
    );
  }
}
