import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';

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

List<PanelChartItemEntity> panelChartItems = [
  PanelChartItemEntity(
    title: 'الموظفين',
    image: Assets.imagesEmployeesIcon,
    value: 13,
    activeColor: AppColors.sandyBrown,
    inactiveColor: AppColors.chartGrey,
    activeText: '13 موظف موقوف',
    inactiveText: '100 الموظفين',
  ),

  PanelChartItemEntity(
    title: 'الرحلات السياحية',
    image: Assets.imagesTripsIcon,
    value: 7,
    activeColor: AppColors.red,
    inactiveColor: AppColors.chartGrey,
    activeText: '100 الرحلات السياحية',
    inactiveText: '19 الرحلات الموقوفة',
  ),
];
