import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../generated/l10n.dart';
import 'logout_button.dart';

class NoPermissionView extends StatelessWidget {
  const NoPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon Container (important for dashboard look)
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // ignore: deprecated_member_use
                color: AppColors.sandyBrown.withOpacity(.08),
              ),
              child: Icon(
                Icons.admin_panel_settings_outlined,
                size: 90,
                color: AppColors.sandyBrown,
              ),
            ),
            const SizedBox(height: 32),

            /// Title
            Text(
              S.of(context).no_pemissions_msg,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold20(context),
            ),
            const SizedBox(height: 32),

            /// Logout Button
            SizedBox(width: 220, child: LogoutButton()),
          ],
        ),
      ),
    );
  }
}
