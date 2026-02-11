import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_circular_button.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.canEdit = false, this.onEdit});
  final bool canEdit;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesTestUser),
                fit: BoxFit.cover,
              ),
            ),
          ),

          if (canEdit)
            Positioned(
              bottom: 0,
              right: 32,
              child: CustomCircularButton(
                icon: LucideIcons.penLine,
                onPressed: onEdit ?? () {},
              ),
            ),
        ],
      ),
    );
  }
}
