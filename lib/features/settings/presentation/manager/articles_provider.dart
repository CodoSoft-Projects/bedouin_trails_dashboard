import 'package:flutter/material.dart';

import '../../data/models/article_model.dart';
import '../../data/repos/articles_repo.dart';

class ArticlesProvider extends ChangeNotifier {
  ArticlesRepo repo = ArticlesRepo();

  String message = '';

  List<ArticleModel> articles = [];
  ArticleModel? selectedArticle;

  /// Get All Articles
  bool? checkGettingArticles = false;

  Future<void> getAllArticles() async {
    checkGettingArticles = null;
    notifyListeners();

    final result = await repo.getAllArticles();
    result.fold(
      (msg) {
        message = msg;
        checkGettingArticles = false;
      },
      (model) {
        articles = model.articles;
        articles.isNotEmpty ? selectedArticle = articles.first : null;
        message = model.message;
        checkGettingArticles = true;
      },
    );
    notifyListeners();
  }

  void onSelectArticle(ArticleModel article) {
    selectedArticle = article;
    notifyListeners();
  }
}
