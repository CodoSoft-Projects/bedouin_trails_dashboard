import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

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
  var metaTitleController = TextEditingController();
  var metaDescriptionController = TextEditingController();
  QuillController quillController = QuillController.basic();
  QuillController viewQuillController = QuillController.basic();

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
    metaTitleController.text = articlee.metaTitle ?? '';
    metaDescriptionController.text = articlee.metaDescription ?? '';

    // Update quill editor if active
    try {
      final delta = jsonDecode(articlee.description);
      quillController.document = Document.fromJson(delta);
      viewQuillController.document = Document.fromJson(delta);
    } catch (e) {
      // Fallback: If it's not JSON, it might be HTML.
      try {
        final delta = HtmlToDelta().convert(articlee.description);
        quillController.document = Document.fromDelta(delta);
        viewQuillController.document = Document.fromDelta(delta);
      } catch (e) {
        // Ultimate fallback to plain text
        quillController.document = Document()..insert(0, articlee.description);
        viewQuillController.document = Document()
          ..insert(0, articlee.description);
      }
    }
    notifyListeners();
  }

  String getHtmlContent() {
    try {
      final deltaJson = List<Map<String, dynamic>>.from(
        quillController.document.toDelta().toJson(),
      );
      final converter = QuillDeltaToHtmlConverter(
        deltaJson,
        ConverterOptions(),
      );
      return converter.convert().replaceAll('\n', '').trim();
    } catch (e) {
      // If it fails to convert (e.g. if the document is empty or has weird content),
      // return the plain text as fallback or the raw description if it's already HTML.
      return quillController.document.toPlainText();
    }
  }

  String getDisplayHtml() {
    final description = selectedArticle?.description ?? '';
    try {
      // Try to see if it's Delta JSON
      jsonDecode(description);
      // If it is, convert the current controller content to HTML
      // (This ensures we see the latest edits if we are in the same screen)
      return getHtmlContent().trim();
    } catch (e) {
      // If it's not JSON, it's likely raw HTML
      return description.trim();
    }
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    metaTitleController.clear();
    metaDescriptionController.clear();
    quillController.clear();
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
      description: jsonEncode(quillController.document.toDelta().toJson()),
      metaTitle: metaTitleController.text,
      metaDescription: metaDescriptionController.text,
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
      description: jsonEncode(quillController.document.toDelta().toJson()),
      metaTitle: metaTitleController.text,
      metaDescription: metaDescriptionController.text,
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

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    metaTitleController.dispose();
    metaDescriptionController.dispose();
    quillController.dispose();
    viewQuillController.dispose();
    super.dispose();
  }
}
