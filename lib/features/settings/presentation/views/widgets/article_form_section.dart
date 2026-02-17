import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/articles_provider.dart';
import 'update_article_dialog.dart';

class ArticleFormSection extends StatelessWidget {
  const ArticleFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  'بيانات عرض المقال :',
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
                  updateArticleDialog(context);
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
                    desc: 'هل تريد حذف هذا المقال؟',
                    onCancel: () {},
                    onOk: () {
                      DialogHelper.showSuccessDialog(
                        context,
                        title: 'تم حذف المقال بنجاح',
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(child: _ArticleForm()),
        ],
      ),
    );
  }
}

class _ArticleForm extends StatelessWidget {
  const _ArticleForm();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ArticlesProvider>();

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: AbsorbPointer(
            child: Skeletonizer(
              enabled: prov.checkGettingArticles == null,
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
                            prov.selectedArticle?.image ?? '',
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
                      text: prov.selectedArticle?.title ?? '',
                    ),
                  ),

                  CustomTextFormField(
                    labelText: 'محتوي المقالة',
                    lines: max(
                      2,
                      ((prov.selectedArticle?.title.length ?? 0) / 40).ceil(),
                    ),
                    controller: TextEditingController(
                      text: prov.selectedArticle?.title ?? '',
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
