import 'package:bedouin_trails_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class TripProgramDayItem extends StatelessWidget {
  const TripProgramDayItem({
    super.key,
    required this.dayNum,
    required this.isSelected,
    this.onTap,
  });
  final int dayNum;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Visibility.maintain(
              visible: isSelected,
              child: Container(
                height: 15,
                width: 12,
                decoration: BoxDecoration(
                  color: AppColors.sandyBrown,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Text(
                  "اليوم \n $dayNum",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular24(context),
                ),
              ),
            ),

            Visibility.maintain(
              visible: isSelected,
              child: Container(
                height: 15,
                width: 12,
                decoration: BoxDecoration(
                  color: AppColors.sandyBrown,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
