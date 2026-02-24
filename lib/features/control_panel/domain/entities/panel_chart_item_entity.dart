import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/employees_stats.dart';
import '../../data/models/trips_stats.dart';

class PanelChartItemEntity {
  final String image;
  final String title;
  final double value; // 0 → 100
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;

  PanelChartItemEntity({
    required this.image,
    required this.title,
    required this.value,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeText,
    required this.inactiveText,
  });
}

List<PanelChartItemEntity> panelChartItems({
  required BuildContext context,
  required TripsStats t,
  required EmployeesStats e,
}) => [
  PanelChartItemEntity(
    title: S.of(context).employees,
    image: Assets.imagesEmployeesIcon,
    value: e.activePercentage,
    activeColor: AppColors.sandyBrown,
    inactiveColor: AppColors.chartGrey,
    activeText: '${e.totalEmployeesActive} ${S.of(context).activeEmployee}',
    inactiveText:
        '${e.totalEmployeesInactive} ${S.of(context).inactiveEmployee}',
  ),

  PanelChartItemEntity(
    title: S.of(context).trips,
    image: Assets.imagesTripsIcon,
    value: t.activePercentage,
    activeColor: AppColors.red,
    inactiveColor: AppColors.chartGrey,
    activeText: '${t.totalActive} ${S.of(context).activeTrips}',
    inactiveText: '${t.totalInactive} ${S.of(context).suspendedTrips}',
  ),
];
