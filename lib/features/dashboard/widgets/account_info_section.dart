import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_cached_network_image.dart';
import '../../profile/presentation/manager/profile_provider.dart';
import '../../profile/presentation/views/profile_view.dart';

class AccountInfoSection extends StatelessWidget {
  const AccountInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
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
              backgroundImage: customCachedNetworkImageprovider(
                prov.accountModel?.image ?? '',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prov.accountModel?.fullName ?? '',
                    style: AppTextStyles.semiBold18(context),
                  ),
                  Text(
                    prov.accountModel?.email ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular16(context),
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
