import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';


class OrderChartListTile extends StatelessWidget {
  const OrderChartListTile({
    super.key,
    required this.title,
    required this.leadingColor,
  });
  final String title;
  final Color leadingColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular16(context),
        ),
        leading: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: leadingColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}