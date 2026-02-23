// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/languages_dialog.dart';

// earth
class EarthIocon extends StatelessWidget {
  const EarthIocon({super.key, this.showBackIcon = true});
  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isArabic()) const SizedBox(width: 40),

        if (showBackIcon) ...[
          CustomCircularButton(
            icon: Icons.arrow_back_ios_new_rounded,
            backgroundColor: Colors.transparent,
            iconColor: AppColors.white,
            size: 18,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 12),
        ],

        CustomCircularButton(
          icon: LucideIcons.earth,
          borderSide: BorderSide.none,
          size: 18,
          iconColor: AppColors.white,
          backgroundColor: Colors.white.withOpacity(0.2),
          onPressed: () {
            languagesDialog(context);
          },
        ),

        const Spacer(),
      ],
    );
  }
}
