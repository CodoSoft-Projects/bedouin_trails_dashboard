import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_white_box.dart';

class CustomInfoField extends StatelessWidget {
  const CustomInfoField({
    super.key,
    this.color = AppColors.white,
    this.title = '',
    this.subtitle = '',
    this.leading,
    this.trilling,
    this.showBorder = false,
    this.borderColor = AppColors.borderGrey,
  });

  final String title, subtitle;
  final Widget? leading;
  final Color color;
  final Widget? trilling;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      hPadding: 16,
      vPadding: 12,
      color: color,
      showBorder: showBorder,
      borderColor: borderColor,
      child: Row(
        children: [
          if (leading != null) ...[
            leading ?? const SizedBox(),
            const SizedBox(width: 6),
          ],
          Text(title, style: AppTextStyles.medium16(context)),
          // const Spacer(),
          Expanded(
            child: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: AppTextStyles.medium16(context),
            ),
          ),
          if (trilling != null) ...[
            const SizedBox(width: 6),
            trilling ?? const SizedBox(),
          ],
        ],
      ),
    );
  }
}
