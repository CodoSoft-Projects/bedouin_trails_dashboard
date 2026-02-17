import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/questions_provider.dart';
import 'widgets/no_questions_section.dart';
import 'widgets/question_form_section.dart';
import 'widgets/questions_section.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});
  static const String routeName = '/questions-view';

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<QuestionsProvider>().getAllQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة الأسئلة الشائعة'),
      body: const QuestionsViewBody(),
    );
  }
}

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<QuestionsProvider>();
    if (prov.checkGettingQuestions == false) {
      return ApiErrorView(msg: prov.message, onRetry: prov.getAllQuestions);
    }
    if (prov.questions.isEmpty && prov.checkGettingQuestions == true) {
      return const NoQuestionsSection();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(flex: 3, child: QuestionsSection()),
          Expanded(flex: 5, child: QuestionFormSection()),
        ],
      ),
    );
  }
}
