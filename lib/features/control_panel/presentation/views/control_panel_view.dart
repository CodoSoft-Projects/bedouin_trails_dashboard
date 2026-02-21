import 'package:flutter/material.dart';

import '../../../../core/widgets/aadaptive_layout_widget.dart';
import 'widgets/panel_bottom_grid.dart';
import 'widgets/panel_charts_grid.dart';
import 'widgets/panel_header_grid.dart';

class ControlPanelView extends StatelessWidget {
  const ControlPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AdaptiveLayoutWidget(
        desktopLayout: (context) => const _Desktop(),
        tabletLayout: (context) => const _Tablet(),
        mobileLayout: (context) => const _Mobile(),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        const PanelHeaderGrid(),
        const SizedBox(height: 16),

        Row(
          spacing: 12,
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            const Expanded(flex: 3, child: PanelChartsGrid()),
            const Expanded(flex: 2, child: PanelBottomGrid()),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        const PanelHeaderGrid(),
        const SizedBox(height: 16),

        Row(
          spacing: 12,
          children: [
            const Expanded(flex: 2, child: PanelChartsGrid()),
            const Expanded(child: PanelBottomGrid()),
          ],
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 12,
      children: [
        SizedBox(height: 12),
        PanelHeaderGrid(),
        PanelChartsGrid(),
        PanelBottomGrid(),
      ],
    );
  }
}
