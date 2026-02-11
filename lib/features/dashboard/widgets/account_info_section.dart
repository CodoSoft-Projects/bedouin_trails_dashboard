import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../profile/presentation/views/profile_view.dart';

class AccountInfoSection extends StatelessWidget {
  const AccountInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProfileView.routeName);
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(Assets.imagesTestUser),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('حياك الله', style: AppTextStyles.semiBold18(context)),
                  Text(
                    'محمد خالد',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.semiBold18(context),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(LucideIcons.settings, size: 20, color: Colors.black),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
