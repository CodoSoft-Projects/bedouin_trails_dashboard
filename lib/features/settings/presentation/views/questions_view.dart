import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static const String routeName = '/questions-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة الأسئلة الشائعة'),
      // body
    );
  }
}
