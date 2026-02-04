import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'size_config.dart';

abstract class AppTextStyles {
  // 8 SemiBold
  static TextStyle semiBold8(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 8),
      fontWeight: FontWeight.w600,
      color: AppColors.black2,
    );
  }

  // 10 Regular
  static TextStyle regular10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 10),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 14 Medium
  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 16 Medium
  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 16 Regular
  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 16 Bold
  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 16),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 18 Regular
  static TextStyle regular18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 18 Medium
  static TextStyle medium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 18 SemiBold
  static TextStyle semiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  // 18 Bold
  static TextStyle bold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 18),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 20 Regular
  static TextStyle regular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 20 Medium
  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 20 SemiBold
  static TextStyle semiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  // 22 Bold
  static TextStyle bold22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 22),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 24 Regular
  static TextStyle regular24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 24),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 24 Medium
  static TextStyle medium24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 24),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 26 Regular
  static TextStyle regular26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 26),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 28 Medium
  static TextStyle medium28(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 28),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  // 32 Regular
  static TextStyle regular32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 32),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 32 Bold
  static TextStyle bold32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 32),
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  // 38 Regular
  static TextStyle regular38(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 38),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // semiBold40
  static TextStyle semiBold40(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 40),
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  // 42 Regular
  static TextStyle regular42(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 42),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 40 ExtraBold
  static TextStyle extraBold40(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 40),
      fontWeight: FontWeight.w800,
      color: AppColors.black,
    );
  }

  // 48 Regular
  static TextStyle regular48(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 48),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 64 Regular
  static TextStyle regular64(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 64),
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    );
  }

  // 280 ExtraBold
  static TextStyle extraBold280(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontsize(context, fontSize: 280),
      fontWeight: FontWeight.w800,
      color: AppColors.black,
    );
  }
}

double getResponsiveFontsize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;

  // Clamp between 75% and 120% of original fontsize
  double lowerLimit = 0.85 * fontSize;
  double upperLimit = 1.2 * fontSize;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  SizeConfig.init(context);
  double width = SizeConfig.width;

  if (width <= SizeConfig.mobile) {
    return width / 600; // Smaller scale for mobile
  } else if (width <= SizeConfig.tablet) {
    return width / 1200;
  } else if (width <= SizeConfig.desktop) {
    return width / 1500;
  } else {
    return width / 2000; // Ultra-wide desktop
  }
}
