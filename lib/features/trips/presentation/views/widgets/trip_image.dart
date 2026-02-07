import 'package:bedouin_trails_dashboard/core/widgets/custom_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/assets.dart';

class TripImage extends StatelessWidget {
  const TripImage({
    super.key,
    this.canDelete = false,
    this.height,
    this.width,
    this.onPressed,
    this.onDelete,
  });
  final bool canDelete;
  final double? height, width;
  final VoidCallback? onPressed, onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(Assets.imagesTestTripImage),
            fit: BoxFit.cover,
          ),
        ),
        child: canDelete
            ? CustomCircularButton(
                onPressed: onDelete ?? () {},
                size: 18,
                icon: LucideIcons.trash2,
              )
            : null,
      ),
    );
  }
}
