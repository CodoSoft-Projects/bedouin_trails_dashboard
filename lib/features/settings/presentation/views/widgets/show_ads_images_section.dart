import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import 'ads_images_grid_view.dart';

class ShowAdsImagesSection extends StatelessWidget {
  const ShowAdsImagesSection({super.key, this.canEdit = false});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'صور الإعلانات :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
              const Spacer(),
              Visibility.maintain(
                visible: canEdit,
                child: CustomButton(
                  text: 'إضافة صور',
                  color: AppColors.sandyBrown,
                  textColor: AppColors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AdsImagesGridView(canEdit: canEdit),
        ],
      ),
    );
  }
}
