import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_white_box.dart';

class EmptyCartImage extends StatelessWidget {
  const EmptyCartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      child: Column(
        children: [
          // const Spacer(),
          CircleAvatar(
            radius: 50,
            // ignore: deprecated_member_use
            backgroundColor: AppColors.sandyBrown.withOpacity(0.25),
            child: Icon(Icons.image, color: AppColors.sandyBrown, size: 50),
          ),
          const SizedBox(height: 8),
          Text(
            'قم بإضافة صورة البطاقة',
            style: AppTextStyles.regular10(context),
          ),
          // const Spacer(),
        ],
      ),
    );
  }
}
