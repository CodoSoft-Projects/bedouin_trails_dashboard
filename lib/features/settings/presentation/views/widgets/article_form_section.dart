// ignore_for_file: use_build_context_synchronously

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
import '../../../../../core/widgets/html_content_viewer.dart';
import '../../../../../generated/l10n.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../manager/articles_provider.dart';
import 'update_article_dialog.dart';

class ArticleFormSection extends StatelessWidget {
  const ArticleFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ArticlesProvider>();
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Skeletonizer(
            enabled: prov.checkGettingArticles == null,
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).articleDisplayData,
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
                      title: S.of(context).confirmation,
                      desc: S.of(context).confirmDeleteArticle,
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
          Expanded(child: _ArticleForm()),
        ],
      ),
    );
  }

  Future<void> _delete(BuildContext context) async {
    //* show loading dialog
    loadingDialog(context);

    var prov = context.read<ArticlesProvider>();
    await prov.deleteArticle();

    //* close dialog
    Navigator.pop(context);

    if (prov.checkDeletingArticle == true) {
      getControlPanelData(context);

      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkDeletingArticle == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
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
                    labelText: S.of(context).articleTitle,
                    controller: TextEditingController(
                      text: prov.selectedArticle?.title ?? '',
                    ),
                  ),

                  CustomTextFormField(
                    labelText: S.of(context).metaTitle,
                    controller: TextEditingController(
                      text: prov.selectedArticle?.metaTitle ?? '',
                    ),
                  ),

                  CustomTextFormField(
                    labelText: S.of(context).metaDescription,
                    lines: 3,
                    controller: TextEditingController(
                      text: prov.selectedArticle?.metaDescription ?? '',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).articleContent,
                        style: AppTextStyles.medium14(
                          context,
                        ).copyWith(color: AppColors.blue),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 24,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: HtmlContentView(
                                html: prov.getDisplayHtml(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
