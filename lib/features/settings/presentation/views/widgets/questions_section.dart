import 'package:bedouin_trails_dashboard/core/widgets/custom_white_box.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
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
                onPressed: () {},
              ),
            ],
          ),

          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return QuestionItem(isSelected: index == 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
