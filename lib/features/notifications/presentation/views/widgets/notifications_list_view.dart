import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import 'notification_item.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key, required this.onItemTap});

  final ValueChanged<void> onItemTap;

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height;
    var itemCount = 10;
    var listHeight = min(height * 0.6, itemCount * 48.0);
    return SizedBox(
      width: SizeConfig.width * 0.8,
      height: listHeight,
      child: ListView.separated(
        itemCount: itemCount,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) {
          return NotificationItem(onItemTap: onItemTap);
        },
      ),
    );
  }
}
