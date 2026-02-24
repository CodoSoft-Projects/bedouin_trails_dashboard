import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/settings_item_model.dart';
import '../../manager/ads_provider.dart';
import 'add_ads_item_dialog.dart';
import 'question_item.dart';

class AdsItemsSection extends StatelessWidget {
  const AdsItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      color: AppColors.whiteGrey,
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  S.of(context).advertisements,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular24(context),
                ),
              ),
              CustomCircularButton(
                icon: Icons.add,
                borderSide: BorderSide.none,
                backgroundColor: AppColors.lightGreen,
                size: 18,
                onPressed: () {
                  context.read<AdsProvider>()
                    ..clearControllers()
                    ..onClearImage();
                  addAdsItemDialog(context);
                },
              ),
            ],
          ),

          Expanded(child: _AdsItemssListView()),
        ],
      ),
    );
  }
}

class _AdsItemssListView extends StatelessWidget {
  const _AdsItemssListView();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AdsProvider>();
    List<SettingsItemModel> loadingItems = List.generate(
      6,
      (index) => SettingsItemModel.empty,
    );

    List<SettingsItemModel> items = prov.checkGettingAds == null
        ? loadingItems
        : prov.adsItems;
    return Skeletonizer(
      enabled: prov.checkGettingAds == null,
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return CartItem(
            isSelected: prov.selectedItem == items[index],
            text: items[index].title,
            onTap: () {
              prov.onSelectAdsItem(items[index]);
            },
          );
        },
      ),
    );
  }
}
