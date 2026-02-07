import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class TripDetailsViewHeader extends StatelessWidget {
  const TripDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leadingWidth: 0,
      leading: const SizedBox(width: 0),
      backgroundColor: AppColors.white,
      flexibleSpace: Container(color: AppColors.white),
      toolbarHeight: 52,
      expandedHeight: 52,
      title: Row(
        spacing: 8,
        children: [
          CustomButton(
            text: 'تعديل بيانات الرحلة',
            color: AppColors.whiteGrey,
            textColor: AppColors.black,
            onPressed: () {},
          ),
          const Spacer(),
          CustomButton(
            text: 'إيقاف برنامج الرحلة',
            color: AppColors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
