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
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/questions_provider.dart';
import 'update_question_dialog.dart';

class QuestionFormSection extends StatelessWidget {
  const QuestionFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<QuestionsProvider>();
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Skeletonizer(
            enabled: prov.checkGettingQuestions == null,
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).questionDisplayData,
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
                    prov.fillControllers(null);
                    updateQuestionDialog(context);
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
                      desc: S.of(context).confirmDeleteQuestion,
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
          const SizedBox(height: 32),
          _QuestionForm(),
        ],
      ),
    );
  }

  Future<void> _delete(BuildContext context) async {
    //* show loading dialog
    loadingDialog(context);

    var prov = context.read<QuestionsProvider>();
    await prov.deleteQuestion();

    //* close dialog
    Navigator.pop(context);

    if (prov.checkDeletingQuestion == true) {
      AppMessage.successBar(context, message: prov.message);
    } else if (prov.checkDeletingQuestion == false) {
      AppMessage.errorBar(context, message: prov.message);
    }
  }
}

class _QuestionForm extends StatelessWidget {
  const _QuestionForm();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<QuestionsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AbsorbPointer(
        child: Skeletonizer(
          enabled: prov.checkGettingQuestions == null,
          child: Column(
            spacing: 12,
            children: [
              const SizedBox(height: 32),

              CustomTextFormField(
                labelText: S.of(context).question,
                controller: TextEditingController(
                  text: prov.selectedQuestion?.question ?? '',
                ),
              ),

              CustomTextFormField(
                labelText: S.of(context).answer,
                lines: max(
                  2,
                  ((prov.selectedQuestion?.answer.length ?? 0) / 40).ceil(),
                ),
                controller: TextEditingController(
                  text: prov.selectedQuestion?.answer ?? '',
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
