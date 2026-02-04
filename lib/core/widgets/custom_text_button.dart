import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    this.onTap,
    this.hasUnderLine = true,
    this.textColor = AppColors.black,
    this.style,
  });

  final String title;
  final VoidCallback? onTap;
  final bool hasUnderLine;
  final Color textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        style ?? AppTextStyles.medium16(context).copyWith(color: textColor);

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: baseStyle.copyWith(
          decoration: hasUnderLine
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: textColor,
          decorationThickness: 1.5,
        ),
      ),
    );
  }
}
