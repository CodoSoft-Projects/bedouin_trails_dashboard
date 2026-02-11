import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../manager/profile_provider.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.canEdit = false});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ProfileProvider>();
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
              color: AppColors.whiteGrey,
              border: Border.all(color: Colors.white, width: 4),
              image: DecorationImage(
                image: prov.imageFile != null && canEdit
                    ? MemoryImage(prov.imageFile!.bytes)
                    : customCachedNetworkImageprovider(
                        prov.accountModel?.image ?? '',
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          if (canEdit)
            Positioned(
              bottom: 0,
              right: 32,
              child: CustomCircularButton(
                icon: prov.imageFile != null
                    ? LucideIcons.x
                    : LucideIcons.penLine,
                onPressed: () {
                  if (prov.imageFile != null) {
                    prov.clearImage();
                  } else {
                    prov.pickFromGallery();
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
