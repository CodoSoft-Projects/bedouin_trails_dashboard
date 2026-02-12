import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/article_form_section.dart';
import 'widgets/articles_section.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});
  static const String routeName = '/articles-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة المقالات'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(flex: 3, child: ArticlesSection()),
            Expanded(flex: 5, child: ArticleFormSection()),
          ],
        ),
      ),
    );
  }
}
