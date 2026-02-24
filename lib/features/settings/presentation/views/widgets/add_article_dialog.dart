// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../manager/articles_provider.dart';

Future<dynamic> addArticleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: S.of(context).addNewArticle,
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
                image: prov.pickedImage == null
                    ? null
                    : DecorationImage(
                        image: MemoryImage(prov.pickedImage!.bytes),
                        fit: BoxFit.cover,
                      ),
              ),

              child: Column(
                children: [
                  const Spacer(),
                  if (prov.pickedImage == null)
                    Text(
                      S.of(context).articleImage,
                      style: AppTextStyles.regular18(
                        context,
                      ).copyWith(color: AppColors.blue),
                    ),
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
            labelText: S.of(context).articleContent,
            hintText: S.of(context).articleContent,
            validator: (value) => simpleValidation(context, value),

            lines: 10,
            controller: prov.descriptionController,
          ),

          const SizedBox(height: 16),

          CustomButton(
            text: S.of(context).save,
            color: AppColors.sandyBrown,
            horizontalPadding: 72,
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                if (prov.pickedImage == null) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).pleaseSelectImage,
                  );
                  return;
                }
                //* show loading dialog
                loadingDialog(context);

                await prov.addNewArticle();

                //* close loading dialog
                Navigator.pop(context);

                if (prov.checkAddingArticle == true) {
                  Navigator.pop(context);
                  getControlPanelData(context);

                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkAddingArticle == false) {
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
