// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/gallery_model.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../manager/trips_provider.dart';

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
                      _remove(context);
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

  Future<void> _remove(BuildContext context) async {
    var prov = context.read<TripsProvider>();

    await prov.removeTripImage(imageId: galleryModel.id);

    if (prov.checkRemoveingImage == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkRemoveingImage == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}
