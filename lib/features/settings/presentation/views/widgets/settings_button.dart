import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.text, this.routeName});
  final String text;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: AppColors.borderGrey),
          ),
        ),
        child: Row(
          children: [
            Icon(LucideIcons.settings, size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium18(context),
              ),
            ),
            const SizedBox(width: 16),
            Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}
