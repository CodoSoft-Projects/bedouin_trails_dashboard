import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import 'widgets/panel_bottom_grid.dart';
import 'widgets/panel_charts_grid.dart';
import 'widgets/panel_header_grid.dart';

class ControlPanelView extends StatelessWidget {
  const ControlPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const PanelHeaderGrid(),
          const SizedBox(height: 16),

          if (SizeConfig.isDesktop())
            const Row(
              children: [
                Expanded(child: PanelBottomGrid()),
                SizedBox(width: 12),
                Expanded(flex: 2, child: PanelChartsGrid()),
              ],
            )
          else ...[
            const PanelChartsGrid(),
            const SizedBox(height: 16),
            const PanelBottomGrid(),
          ],

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
