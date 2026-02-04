import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.borderSide = const BorderSide(color: AppColors.borderGrey),
    this.backgroundColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.size = 22.0,
    this.shape,
    this.showDottedBorder = false,
    this.dottedBorderColor = AppColors.borderGrey,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final BorderSide borderSide;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final OutlinedBorder? shape;
  final bool showDottedBorder;
  final Color dottedBorderColor;

  @override
  Widget build(BuildContext context) {
    return showDottedBorder
        ? DottedBorder(
            options: CircularDottedBorderOptions(
              strokeCap: StrokeCap.round,
              padding: EdgeInsets.zero,
              borderPadding: EdgeInsets.zero,
              color: dottedBorderColor,
              strokeWidth: 1.0,
              dashPattern: const [3, 5],
            ),
            child: MyCirclurarButton(
              shape: shape,
              borderSide: borderSide,
              backgroundColor: backgroundColor,
              icon: icon,
              iconColor: iconColor,
              size: size,
              onPressed: onPressed,
              showDottedBorder: showDottedBorder,
            ),
          )
        : MyCirclurarButton(
            shape: shape,
            borderSide: borderSide,
            backgroundColor: backgroundColor,
            icon: icon,
            iconColor: iconColor,
            size: size,
            onPressed: onPressed,
            showDottedBorder: showDottedBorder,
          );
  }
}

class MyCirclurarButton extends StatelessWidget {
  const MyCirclurarButton({
    super.key,
    required this.shape,
    required this.borderSide,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.size,
    required this.onPressed,
    this.showDottedBorder = true,
  });

  final OutlinedBorder? shape;
  final BorderSide borderSide;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;
  final bool showDottedBorder;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: showDottedBorder
          ? null
          : IconButton.styleFrom(
              shape: shape ?? const CircleBorder(),
              side: borderSide,
              backgroundColor: backgroundColor,
            ),
      icon: Icon(icon, color: iconColor, size: size),
      onPressed: onPressed,
    );
  }
}
