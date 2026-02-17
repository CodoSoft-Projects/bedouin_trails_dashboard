import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/questions_provider.dart';
import 'add_question_dialog.dart';

class NoQuestionsSection extends StatelessWidget {
  const NoQuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.read<QuestionsProvider>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ===== Illustration Shape =====
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.sandyBrown.withOpacity(.07),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.help_outline_rounded,
                      size: 95,
                      // ignore: deprecated_member_use
                      color: AppColors.sandyBrown.withOpacity(.9),
                    ),

                    /// floating add icon
                    Positioned(
                      bottom: 18,
                      right: 18,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.sandyBrown,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: AppColors.sandyBrown.withOpacity(.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),

              /// ===== Title =====
              Text(
                S.of(context).no_questions_title,
                style: AppTextStyles.semiBold40(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              /// ===== Message =====
              Text(
                S.of(context).no_questions_msg,
                style: AppTextStyles.regular16(
                  context,
                ).copyWith(color: Colors.grey.shade600, height: 1.6),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 14),

              /// ===== Hint =====
              Text(
                S.of(context).no_questions_hint,
                style: AppTextStyles.regular20(
                  context,
                ).copyWith(color: Colors.grey.shade500),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36),

              /// ===== CTA Button =====
              SizedBox(
                width: 260,
                child: CustomButton(
                  text: S.of(context).add_new_question,
                  color: AppColors.sandyBrown,
                  onPressed: () {
                    prov.clearControllers();
                    addQuestionDialog(context);
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// ===== Refresh =====
              TextButton.icon(
                onPressed: () {
                  prov.getAllQuestions();
                },
                icon: const Icon(Icons.refresh),
                label: Text(S.of(context).refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
