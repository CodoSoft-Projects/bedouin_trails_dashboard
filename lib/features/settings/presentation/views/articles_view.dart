import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/articles_provider.dart';
import 'widgets/article_form_section.dart';
import 'widgets/articles_section.dart';
import 'widgets/no_articles_section.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});
  static const String routeName = '/articles-view';

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<ArticlesProvider>().getAllArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'إدارة المقالات'),
      body: const ArticlesViewBody(),
    );
  }
}

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ArticlesProvider>();
    if (prov.checkGettingArticles == false) {
      ApiErrorView(msg: prov.message, onRetry: prov.getAllArticles);
    }
    if (prov.articles.isEmpty && prov.checkGettingArticles == true) {
      return const NoArticlesScreen();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: ArticlesSection()),
          Expanded(flex: 5, child: ArticleFormSection()),
        ],
      ),
    );
  }
}
