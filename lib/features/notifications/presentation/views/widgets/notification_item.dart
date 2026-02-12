import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'notification_dialog.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.onItemTap});
  final ValueChanged<void> onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        onItemTap.call(null);
        notificationDialog(context);
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: const AssetImage(Assets.imagesTestUser),
      ),
      title: Text(
        'خالد ابن سلمان',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.regular16(context),
      ),
      subtitle: Text(
        'تم حدوث خلاف في يوم التسليم مع محمد خالد ابن سلمان',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.regular16(context),
      ),
      //11 يناير 2026
      trailing: Text(
        '11 يناير 2026',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.regular16(context),
      ),
    );
  }
}
