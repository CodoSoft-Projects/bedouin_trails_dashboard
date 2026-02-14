import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/gallery_model.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';

class TripImage extends StatelessWidget {
  const TripImage({
    super.key,
    this.canDelete = false,
    this.height,
    this.width,
    required this.galleryModel,
  });
  final bool canDelete;
  final double? height, width;
  final GalleryModel galleryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: customCachedNetworkImageprovider(galleryModel.image),
            fit: BoxFit.cover,
          ),
        ),
        child: canDelete
            ? CustomCircularButton(
                onPressed: () {
                  DialogHelper.showQuestionDialog(
                    context,
                    title: 'تاكيد',
                    desc: 'هل تريد حذف الصورة',
                    onCancel: () {},
                    onOk: () {
                      DialogHelper.showSuccessDialog(
                        context,
                        title: 'تم حذف الصورة',
                      );
                    },
                  );
                },
                size: 18,
                icon: LucideIcons.trash2,
              )
            : null,
      ),
    );
  }
}
