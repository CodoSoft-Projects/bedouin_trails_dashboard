import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(4.0),
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          const Spacer(),
          Center(
            child: Text(
              'تسجيل الخروج',
              style: AppTextStyles.regular16(context),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sandyBrown,
            ),
            child: Icon(LucideIcons.logOut, size: 16, color: AppColors.white),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
