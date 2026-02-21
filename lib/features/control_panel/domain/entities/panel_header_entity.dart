import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../core/utils/app_colors.dart';

class PanelHeaderEntity {
  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;

  PanelHeaderEntity({
    required this.title,
    required this.subtitle,
    required this.image,
    this.backgroundColor = AppColors.whiteGrey,
  });
}

List<PanelHeaderEntity> panelHeadersList({
  required BuildContext context,
  required int newBookings,
  required int users,
  required int articles,
}) => [
  PanelHeaderEntity(
    title: 'حجوزات جديدة لليوم',
    subtitle: newBookings.toString(),
    image: Assets.imagesNewBookingIcon,
  ),
  PanelHeaderEntity(
    title: 'عدد المستخدمين',
    subtitle: users.toString(),
    image: Assets.imagesUsersIcon,
  ),
  PanelHeaderEntity(
    title: 'عدد المقالات في الموقع',
    subtitle: articles.toString(),
    image: Assets.imagesReportsIcon,
  ),
];

List<PanelHeaderEntity> panelBottomList({
  required BuildContext context,
  required double revenueGrowth,
  required int cancelRate,
  required int newUsersPercentage,
}) => [
  PanelHeaderEntity(
    title: 'معدل التقييمات',
    subtitle: '$revenueGrowth / 5',
    image: Assets.imagesRattingIcon,
    backgroundColor: AppColors.white,
  ),
  PanelHeaderEntity(
    title: 'معدل إلغاء الحجوزات',
    subtitle: '$cancelRate %',
    image: Assets.imagesCancelIcon,
    backgroundColor: AppColors.white,
  ),
  PanelHeaderEntity(
    title: 'معدل زيادة المستخدمين الجدد',
    image: Assets.imagesUsersIcon,
    subtitle: '$newUsersPercentage %',
    backgroundColor: AppColors.white,
  ),
];
