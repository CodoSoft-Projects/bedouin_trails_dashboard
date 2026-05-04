// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/articles_provider.dart';

Future<dynamic> updateArticleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: S.of(context).editArticleData,
        content: _Form(),
      );
    },
  );
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ArticlesProvider>();
    var article = prov.selectedArticle!;

    return Form(
      key: prov.formKey,
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(width: 600),
          AspectRatio(
            aspectRatio: 584 / 264,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderGrey),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: prov.pickedImage == null
                      ? customCachedNetworkImageprovider(article.image)
                      : MemoryImage(prov.pickedImage!.bytes),
                  fit: BoxFit.cover,
                ),
              ),

              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      CustomCircularButton(
                        icon: prov.pickedImage == null
                            ? LucideIcons.upload
                            : LucideIcons.x,
                        size: 18,
                        borderSide: BorderSide.none,
                        backgroundColor: AppColors.whiteGrey,
                        onPressed: () {
                          if (prov.pickedImage == null) {
                            prov.onPickImage();
                          } else {
                            prov.onClearImage();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          CustomTextFormField(
            labelText: S.of(context).articleTitle,
            hintText: S.of(context).articleTitle,
            validator: (value) => simpleValidation(context, value),
            controller: prov.titleController,
          ),

          CustomTextFormField(
            labelText: S.of(context).metaTitle,
            // validator: (value) => simpleValidation(context, value),
            controller: prov.metaTitleController,
          ),

          CustomTextFormField(
            labelText: S.of(context).metaDescription,
            // validator: (value) => simpleValidation(context, value),
            lines: 3,
            controller: prov.metaDescriptionController,
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
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderGrey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    QuillSimpleToolbar(
                      controller: prov.quillController,
                      config: QuillSimpleToolbarConfig(
                        showFontFamily: false,
                        showFontSize: false,
                        multiRowsDisplay: false,
                        color: AppColors.whiteGrey,
                      ),
                    ),
                    const Divider(height: 1),
                    Container(
                      constraints: const BoxConstraints(minHeight: 200),
                      decoration: BoxDecoration(
                        color: AppColors.whiteGrey,
                        border: Border.all(color: AppColors.borderGrey),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: QuillEditor.basic(
                        controller: prov.quillController,
                        config: const QuillEditorConfig(
                          padding: EdgeInsets.all(16),
                          scrollable: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          CustomButton(
            text: S.of(context).saveChanges,
            color: AppColors.sandyBrown,
            horizontalPadding: 72,
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                //* show loading dialog
                loadingDialog(context);

                await prov.updateArticle();

                //* close loading dialog
                Navigator.pop(context);

                if (prov.checkUpdatingArticle == true) {
                  Navigator.pop(context);

                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkUpdatingArticle == false) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: prov.message,
                  );
                }
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
