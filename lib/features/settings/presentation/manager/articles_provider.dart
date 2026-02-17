import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../data/models/article_model.dart';
import '../../data/repos/articles_repo.dart';

class ArticlesProvider extends ChangeNotifier {
  ArticlesRepo repo = ArticlesRepo();

  String message = '';

  List<ArticleModel> articles = [];
  ArticleModel? selectedArticle;
  PickedImage? pickedImage;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

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
        if (articles.isNotEmpty) onSelectArticle(articles.first);
        message = model.message;
        checkGettingArticles = true;
      },
    );
    notifyListeners();
  }

  void fillControllers(ArticleModel article) {
    titleController.text = article.title;
    descriptionController.text = article.description;
    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  void onSelectArticle(ArticleModel article) {
    selectedArticle = article;
    fillControllers(article);
  }

  void onPickImage() async {
    pickedImage = await pickImageUniversal();
    notifyListeners();
  }

  void onClearImage() {
    pickedImage = null;
    notifyListeners();
  }

  /// Add New Article
  bool? checkAddingArticle = false;

  Future<void> addNewArticle() async {
    checkAddingArticle = null;
    notifyListeners();

    final result = await repo.addNewArticle(
      image: pickedImage!,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkAddingArticle = false;
      },
      (model) {
        message = model.message;
        checkAddingArticle = true;
        getAllArticles();
      },
    );
    notifyListeners();
  }
}
