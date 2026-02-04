// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../../../../../core/widgets/custom_circular_button.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, this.showBackIcon = true});
  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    var isDesktop = SizeConfig.isDesktop();
    return Row(
      spacing: 8,
      children: [
        if (showBackIcon && !isDesktop)
          CustomCircularButton(
            icon: Icons.arrow_back_ios_new_rounded,
            backgroundColor: Colors.transparent,
            iconColor: AppColors.black,
            size: 18,
            onPressed: () {
              Navigator.pop(context);
            },
          ),

        if (!isDesktop) ...[
          CustomCircularButton(
            icon: LucideIcons.earth,
            size: 18,
            iconColor: AppColors.black,
            backgroundColor: Colors.white.withOpacity(0.2),
            onPressed: () {},
          ),
        ],
        const Spacer(),
        AppLogo(),
      ],
    );
  }
}
