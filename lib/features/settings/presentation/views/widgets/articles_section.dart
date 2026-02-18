import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../data/models/settings_item_model.dart';
import '../../manager/articles_provider.dart';
import 'add_article_dialog.dart';
import 'question_item.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

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
                  'فقرة المقالات',
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
                  context.read<ArticlesProvider>()
                    ..clearControllers()
                    ..onClearImage();
                  addArticleDialog(context);
                },
              ),
            ],
          ),

          Expanded(child: _ArticlesListView()),
        ],
      ),
    );
  }
}

class _ArticlesListView extends StatelessWidget {
  const _ArticlesListView();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ArticlesProvider>();
    List<SettingsItemModel> loadingArticles = List.generate(
      6,
      (index) => SettingsItemModel.empty,
    );

    List<SettingsItemModel> articles = prov.checkGettingArticles == null
        ? loadingArticles
        : prov.articles;
    return Skeletonizer(
      enabled: prov.checkGettingArticles == null,
      child: ListView.separated(
        itemCount: articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return CartItem(
            isSelected: prov.selectedArticle == articles[index],
            text: articles[index].title,
            onTap: () {
              prov.onSelectArticle(articles[index]);
            },
          );
        },
      ),
    );
  }
}
