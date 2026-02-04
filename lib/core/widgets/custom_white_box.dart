import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomWhiteBox extends StatelessWidget {
  const CustomWhiteBox({
    super.key,
    required this.child,
    this.color = AppColors.white,
    this.hPadding = 16,
    this.vPadding = 12,
    this.showBorder = false,
    this.borderColor = AppColors.borderGrey,
  });

  final Widget child;
  final Color color;
  final double hPadding, vPadding;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
