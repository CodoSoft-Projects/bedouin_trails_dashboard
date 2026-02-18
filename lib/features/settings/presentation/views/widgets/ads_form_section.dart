// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/ads_provider.dart';
import 'update_ads_item_dialog.dart';

class AdsFormSection extends StatelessWidget {
  const AdsFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AdsProvider>();
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Skeletonizer(
            enabled: prov.checkGettingAds == null,
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    'بيانات عرض الإعلان :',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular24(
                      context,
                    ).copyWith(fontFamily: Constants.vexaFontFamily),
                  ),
                ),

                const Spacer(),

                CustomCircularButton(
                  backgroundColor: AppColors.whiteGrey,
                  icon: LucideIcons.squarePen,
                  borderSide: BorderSide.none,
                  size: 18,
                  onPressed: () {
                    prov
                      ..onClearImage()
                      ..fillControllers(null);
                    updateAdsItemDialog(context);
                  },
                ),

                CustomCircularButton(
                  backgroundColor: AppColors.whiteGrey,
                  icon: LucideIcons.trash2,
                  borderSide: BorderSide.none,
                  size: 18,
                  onPressed: () {
                    DialogHelper.showQuestionDialog(
                      context,
                      title: 'تاكيد',
                      desc: 'هل تريد حذف هذا الإعلان؟',
                      onCancel: () {},
                      onOk: () {
                        _delete(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(child: _AdsItemForm()),
        ],
      ),
    );
  }

  Future<void> _delete(BuildContext context) async {
    //* show loading dialog
    loadingDialog(context);

    var prov = context.read<AdsProvider>();
    await prov.deleteAdsItem();

    //* close dialog
    Navigator.pop(context);

    if (prov.checkDeletingAdsItem == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkDeletingAdsItem == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}

class _AdsItemForm extends StatelessWidget {
  const _AdsItemForm();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AdsProvider>();

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: AbsorbPointer(
            child: Skeletonizer(
              enabled: prov.checkGettingAds == null,
              child: Column(
                spacing: 12,
                children: [
                  const SizedBox(height: 32),
                  AspectRatio(
                    aspectRatio: 584 / 264,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: customCachedNetworkImageprovider(
                            prov.selectedItem?.image ?? '',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    labelText: 'عنوان المقال',
                    controller: TextEditingController(
                      text: prov.selectedItem?.title ?? '',
                    ),
                  ),

                  CustomTextFormField(
                    labelText: 'محتوي المقالة',
                    lines: max(
                      2,
                      ((prov.selectedItem?.description.length ?? 0) / 40)
                          .ceil(),
                    ),
                    controller: TextEditingController(
                      text: prov.selectedItem?.description ?? '',
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
