import 'dart:math';

import 'package:flutter/material.dart';

import '../../../domain/entities/panel_header_entity.dart';
import 'panel_header_item.dart';

class PanelBottomGrid extends StatelessWidget {
  const PanelBottomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var crossAxisCount = (width / 200).toInt();
        crossAxisCount = (crossAxisCount / 3).toInt() * 3;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(crossAxisCount, 1),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
            mainAxisExtent: 160,
          ),
          itemCount: panelBottomList.length,
          itemBuilder: (context, index) {
            return PanelHeaderItem(panelHeaderEntity: panelBottomList[index]);
          },
        );
      },
    );
  }
}
