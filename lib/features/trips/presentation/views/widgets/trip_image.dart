import 'package:bedouin_trails_dashboard/core/widgets/custom_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/dialog_helper.dart';

class TripImage extends StatelessWidget {
  const TripImage({super.key, this.canDelete = false, this.height, this.width});
  final bool canDelete;
  final double? height, width;

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
            image: AssetImage(Assets.imagesTestTripImage),
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
