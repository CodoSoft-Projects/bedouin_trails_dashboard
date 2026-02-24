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
import '../../manager/ads_provider.dart';

Future<dynamic> addAdsItemDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'إضافة إعلان جديد',
        content: _Form(),
      );
    },
  );
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<AdsProvider>();
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
                      'صورة الإعلان',
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
            labelText: 'عنوان الإعلان',
            hintText: 'عنوان الإعلان',
            validator: (value) => simpleValidation(context, value),

            controller: prov.titleController,
          ),

          CustomTextFormField(
            labelText: 'محتوي الإعلان',
            hintText: 'محتوي الإعلان',
            validator: (value) => simpleValidation(context, value),

            lines: 10,
            controller: prov.descriptionController,
          ),

          const SizedBox(height: 16),

          CustomButton(
            text: 'حفظ',
            color: AppColors.sandyBrown,
            horizontalPadding: 72,
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                if (prov.pickedImage == null) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: 'يرجى اختيار صورة',
                  );
                  return;
                }
                //* show loading dialog
                loadingDialog(context);

                await prov.addNewItem();

                //* close loading dialog
                Navigator.pop(context);

                if (prov.checkAddingItem == true) {
                  Navigator.pop(context);

                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkAddingItem == false) {
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
