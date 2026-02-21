import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../domain/entities/panel_chart_item_entity.dart';
import 'half_circle_progress.dart';

class PanelChartItem extends StatelessWidget {
  const PanelChartItem({super.key, required this.item});
  final PanelChartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 220,
      // width: 220,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              // vertical: 12.0,
            ),
            child: Row(
              children: [
                Image.asset(item.image, height: 24, width: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular20(
                      context,
                    ).copyWith(fontFamily: Constants.vexaFontFamily),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: HalfCircleProgress(
              value: item.value,
              width: 220,
              activeColor: item.activeColor,
              inactiveColor: item.inactiveColor,
            ),
          ),
          const SizedBox(height: 24),
          _InfoListTile(text: item.activeText, color: item.activeColor),
          const SizedBox(height: 4),
          _InfoListTile(text: item.inactiveText, color: item.inactiveColor),
        ],
      ),
    );
  }
}

class _InfoListTile extends StatelessWidget {
  const _InfoListTile({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.medium18(context)),
      ],
    );

    // ListTile(
    //   contentPadding: EdgeInsets.zero,
    //   title: Text(text, style: AppTextStyles.medium18(context)),
    //   leading: CircleAvatar(radius: 10, backgroundColor: color),
    // );
  }
}
