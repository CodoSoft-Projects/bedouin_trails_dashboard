// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/questions_provider.dart';

Future<dynamic> updateQuestionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 500,
        title: S.of(context).editQuestionData,
        content: _Form(),
      );
    },
  );
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<QuestionsProvider>();

    return Form(
      key: prov.formKey,
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(width: 500),

          CustomTextFormField(
            labelText: S.of(context).question,
            hintText: S.of(context).question,
            validator: (value) => simpleValidation(context, value),

            controller: prov.questionController,
          ),

          CustomTextFormField(
            labelText: S.of(context).answer,
            hintText: S.of(context).answer,
            lines: 7,
            validator: (value) => simpleValidation(context, value),

            controller: prov.answerController,
          ),

          const SizedBox(height: 16),

          CustomButton(
            text: S.of(context).saveChanges,
            color: AppColors.sandyBrown,
            horizontalPadding: 42,
            onPressed: () async {
              if (prov.formKey.currentState!.validate()) {
                //* show loading dialog
                loadingDialog(context);

                await prov.updateQuestion();

                //* close loading dialog
                Navigator.pop(context);

                if (prov.checkUpdatingQuestion == true) {
                  Navigator.pop(context);

                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkUpdatingQuestion == false) {
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
