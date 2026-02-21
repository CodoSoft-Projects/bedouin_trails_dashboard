import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/aadaptive_layout_widget.dart';
import '../../../../core/widgets/api_error_widget.dart';
import '../../domain/entities/panel_header_entity.dart';
import '../manager/control_panel_provider.dart';
import 'widgets/orders_chart_section.dart';
import 'widgets/panel_bottom_grid.dart';
import 'widgets/panel_charts_grid.dart';
import 'widgets/panel_header_grid.dart';
import 'widgets/panel_header_item.dart';

class ControlPanelView extends StatelessWidget {
  const ControlPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ControlPanelProvider>();
    return prov.checkGetting == false
        ? ApiErrorView(msg: prov.message, onRetry: prov.getControlPanelData)
        : SingleChildScrollView(
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
    return const Column(
      children: [
        SizedBox(height: 12),
        PanelHeaderGrid(),
        SizedBox(height: 16),

        Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: _RightSection()),
            Expanded(flex: 5, child: PanelChartsGrid()),
            Expanded(flex: 4, child: PanelBottomGrid()),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        const SizedBox(height: 12),
        const PanelHeaderGrid(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            const Expanded(child: _RightSection()),
            const Expanded(child: PanelChartsGrid()),
          ],
        ),
        PanelBottomGrid(),
        const SizedBox(height: 16),
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
        _RightSection(),
        PanelChartsGrid(),
        PanelBottomGrid(),
        SizedBox(height: 12),
      ],
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ControlPanelProvider>();
    return Column(
      spacing: 12,
      children: [
        Skeletonizer(
          enabled: prov.checkGetting == null,
          child: PanelHeaderItem(
            panelHeaderEntity: PanelHeaderEntity(
              title: 'نسبة نمو الواردات للشهر الحالي',
              subtitle: '${prov.controlPanelData.averageRating} %',
              image: Assets.imagesGrownIcon,
              backgroundColor: AppColors.white,
            ),
          ),
        ),
        OrdersChartSection(),
      ],
    );
  }
}
