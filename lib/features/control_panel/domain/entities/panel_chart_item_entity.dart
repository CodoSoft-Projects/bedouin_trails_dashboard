import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
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
    title: 'الموظفين',
    image: Assets.imagesEmployeesIcon,
    value: e.activePercentage,
    activeColor: AppColors.sandyBrown,
    inactiveColor: AppColors.chartGrey,
    activeText: '${e.totalEmployeesActive} موظف نشط',
    inactiveText: '${e.totalEmployeesInactive} موظف موقوف',
  ),

  PanelChartItemEntity(
    title: 'الرحلات السياحية',
    image: Assets.imagesTripsIcon,
    value: t.activePercentage,
    activeColor: AppColors.red,
    inactiveColor: AppColors.chartGrey,
    activeText: '${t.totalActive} الرحلات النشطة',
    inactiveText: '${t.totalInactive} الرحلات الموقوفة',
  ),
];
