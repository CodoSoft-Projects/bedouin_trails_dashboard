import 'package:bedouin_trails_dashboard/core/widgets/custom_white_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../data/models/question_model.dart';
import '../../manager/questions_provider.dart';
import 'add_question_dialog.dart';
import 'question_item.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

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
                  'فقرة الأسئلة الشائعة',
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
                  context.read<QuestionsProvider>().clearControllers();
                  addQuestionDialog(context);
                },
              ),
            ],
          ),

          Expanded(child: _QuestionsListView()),
        ],
      ),
    );
  }
}

class _QuestionsListView extends StatelessWidget {
  const _QuestionsListView();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<QuestionsProvider>();
    List<QuestionModel> loadingQuestions = List.generate(
      6,
      (index) => QuestionModel.empty,
    );

    List<QuestionModel> questions = prov.checkGettingQuestions == null
        ? loadingQuestions
        : prov.questions;

    return Skeletonizer(
      enabled: prov.checkGettingQuestions == null,
      child: ListView.separated(
        itemCount: questions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return CartItem(
            isSelected: prov.selectedQuestion == questions[index],
            text: questions[index].question,
            onTap: () {
              prov.onSelectQuestion(questions[index]);
            },
          );
        },
      ),
    );
  }
}
