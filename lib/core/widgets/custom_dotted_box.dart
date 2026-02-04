import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomDottedBox extends StatelessWidget {
  const CustomDottedBox({
    super.key,
    required this.child,
    this.color = AppColors.white,
    this.hPadding = 16,
    this.vPadding = 8,
    this.borderColor = AppColors.blue,
  });

  final Widget child;
  final Color color;
  final double hPadding, vPadding;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        strokeCap: StrokeCap.round,
        radius: const Radius.circular(16),
        borderPadding: EdgeInsets.zero,
        color: borderColor,
        strokeWidth: 2.0,
        dashPattern: const [7.5, 7.5],
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      ),
      child: child,
    );
  }
}
