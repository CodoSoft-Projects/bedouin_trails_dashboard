import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = AppColors.black,
    this.textColor = AppColors.white,
    this.fontFamily = Constants.elMessiriFontFamily,
    this.text = '',
    this.horizontalPadding = 24.0,
    this.showBottomBorder = false,
    this.icon,
    this.onPressed,
  });

  final Color color, textColor;
  final String fontFamily;
  final String text;
  final double horizontalPadding;
  final Widget? icon;
  final bool showBottomBorder;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: showBottomBorder
              ? BorderSide(color: AppColors.blue, width: 1.5)
              : BorderSide.none,
        ),
      ),
      child: MaterialButton(
        color: color,
        textColor: textColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 16.0,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              FittedBox(fit: BoxFit.scaleDown, child: icon!),
              const SizedBox(width: 8.0),
            ],
            Text(
              text,
              style: AppTextStyles.medium16(
                context,
              ).copyWith(fontFamily: fontFamily, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
