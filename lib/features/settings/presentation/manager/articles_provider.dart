import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../data/models/settings_item_model.dart';
import '../../data/repos/articles_repo.dart';

class ArticlesProvider extends ChangeNotifier {
  ArticlesRepo repo = ArticlesRepo();

  String message = '';

  List<SettingsItemModel> articles = [];
  SettingsItemModel? selectedArticle;
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
        articles = model.items;
        if (articles.isNotEmpty) onSelectArticle(articles.first);
        message = model.message;
        checkGettingArticles = true;
      },
    );
    notifyListeners();
  }

  void fillControllers(SettingsItemModel? article) {
    var articlee = article ?? selectedArticle;
    titleController.text = articlee!.title;
    descriptionController.text = articlee.description;
    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  void onSelectArticle(SettingsItemModel article) {
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
        clearControllers();
        getAllArticles();
      },
    );
    notifyListeners();
  }

  /// Update Article
  bool? checkUpdatingArticle = false;

  Future<void> updateArticle() async {
    checkUpdatingArticle = null;
    notifyListeners();

    final result = await repo.updateArticle(
      id: selectedArticle!.id,
      image: pickedImage,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingArticle = false;
      },
      (model) {
        message = model.message;
        checkUpdatingArticle = true;
        onSelectArticle(model.item);
        replaceArticle(model.item);
      },
    );
    notifyListeners();
  }

  /// Replace article form the list with new article
  void replaceArticle(SettingsItemModel article) {
    final index = articles.indexWhere((element) => element.id == article.id);
    if (index != -1) articles[index] = article;
    notifyListeners();
  }

  /// Delete Article
  bool? checkDeletingArticle = false;

  Future<void> deleteArticle() async {
    checkDeletingArticle = null;
    notifyListeners();

    final result = await repo.deleteArticle(id: selectedArticle!.id);
    result.fold(
      (msg) {
        message = msg;
        checkDeletingArticle = false;
      },
      (model) {
        message = model.message;
        checkDeletingArticle = true;
        articles.removeWhere((element) => element.id == selectedArticle!.id);
        selectedArticle = null;
        if (articles.isNotEmpty) onSelectArticle(articles.first);
      },
    );
    notifyListeners();
  }
}
