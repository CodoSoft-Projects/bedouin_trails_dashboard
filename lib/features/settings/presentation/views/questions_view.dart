import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/question_form_section.dart';
import 'widgets/questions_section.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static const String routeName = '/questions-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة الأسئلة الشائعة'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(flex: 3, child: QuestionsSection()),
            Expanded(flex: 5, child: QuestionFormSection()),
          ],
        ),
      ),
    );
  }
}
