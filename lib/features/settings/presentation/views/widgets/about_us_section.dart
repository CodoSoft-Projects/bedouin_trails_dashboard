import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../data/models/about_us_model.dart';
import '../../manager/about_us_provider.dart';
import 'add_about_us_item_dialog.dart';
import 'question_item.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

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
                  'العناصر المعروضة',
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
                  context.read<AboutUsProvider>()
                    ..clearControllers()
                    ..onClearImage();
                  addAboutUsItemDialog(context);
                },
              ),
            ],
          ),

          Expanded(child: _ItemsListView()),
        ],
      ),
    );
  }
}

class _ItemsListView extends StatelessWidget {
  const _ItemsListView();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AboutUsProvider>();
    List<AboutUsModel> loadingItems = List.generate(
      6,
      (index) => AboutUsModel.empty,
    );

    List<AboutUsModel> items = prov.checkGettingItems == null
        ? loadingItems
        : prov.items;
    return Skeletonizer(
      enabled: prov.checkGettingItems == null,
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return CartItem(
            isSelected: prov.selectedItem == items[index],
            text: items[index].title,
            onTap: () {
              prov.onSelectItem(items[index]);
            },
          );
        },
      ),
    );
  }
}
