// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ImageLoadingFailed extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const ImageLoadingFailed({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 180,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.black2.withOpacity(.08),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.broken_image_rounded,
            size: 34,
            color: AppColors.black2.withOpacity(.6),
          ),
        ),
      ),
    );
  }
}
