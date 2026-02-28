import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

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
    title: S.of(context).todayNewBookings,
    subtitle: newBookings.toString(),
    image: Assets.imagesNewBookingIcon,
  ),
  PanelHeaderEntity(
    title: S.of(context).numberOfUsers,
    subtitle: users.toString(),
    image: Assets.imagesUsersIcon,
  ),
  PanelHeaderEntity(
    title: S.of(context).numberOfArticles,
    subtitle: articles.toString(),
    image: Assets.imagesReportsIcon,
  ),
];

List<PanelHeaderEntity> panelBottomList({
  required BuildContext context,
  required double averageRating,
  required int cancelRate,
  required int newUsersPercentage,
}) => [
  PanelHeaderEntity(
    title: S.of(context).ratingRate,
    subtitle: '$averageRating / 5',
    image: Assets.imagesRattingIcon,
    backgroundColor: AppColors.white,
  ),
  PanelHeaderEntity(
    title: S.of(context).cancellationRate,
    subtitle: '$cancelRate %',
    image: Assets.imagesCancelIcon,
    backgroundColor: AppColors.white,
  ),
  PanelHeaderEntity(
    title: S.of(context).newUsersGrowthRate,
    image: Assets.imagesUsersIcon,
    subtitle: '$newUsersPercentage %',
    backgroundColor: AppColors.white,
  ),
];
