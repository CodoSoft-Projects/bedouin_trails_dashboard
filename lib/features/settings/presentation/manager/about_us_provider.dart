import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../data/models/about_us_model.dart';
import '../../data/repos/about_us_repo.dart';

class AboutUsProvider extends ChangeNotifier {
  AboutUsRepo repo = AboutUsRepo();

  String message = '';

  List<AboutUsModel> items = [];
  AboutUsModel? selectedItem;
  PickedImage? pickedImage;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  /// Get All Items
  bool? checkGettingItems = false;

  Future<void> getAllItems() async {
    checkGettingItems = null;
    notifyListeners();

    final result = await repo.getAllItems();
    result.fold(
      (msg) {
        message = msg;
        checkGettingItems = false;
      },
      (model) {
        items = model.items;
        if (items.isNotEmpty) onSelectItem(items.first);
        message = model.message;
        checkGettingItems = true;
      },
    );
    notifyListeners();
  }

  void fillControllers(AboutUsModel? item) {
    var newItem = item ?? selectedItem;
    titleController.text = newItem!.title;
    descriptionController.text = newItem.description;
    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  void onSelectItem(AboutUsModel item) {
    selectedItem = item;
    fillControllers(item);
  }

  void onPickImage() async {
    pickedImage = await pickImageUniversal();
    notifyListeners();
  }

  void onClearImage() {
    pickedImage = null;
    notifyListeners();
  }

  /// Add New Item
  bool? checkAddingItem = false;

  Future<void> addNewItem() async {
    checkAddingItem = null;
    notifyListeners();

    final result = await repo.addNewItem(
      image: pickedImage!,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkAddingItem = false;
      },
      (model) {
        message = model.message;
        checkAddingItem = true;
        clearControllers();
        getAllItems();
      },
    );
    notifyListeners();
  }

  /// Update Item
  bool? checkUpdatingItem = false;

  Future<void> updateItem() async {
    checkUpdatingItem = null;
    notifyListeners();

    final result = await repo.updateItem(
      id: selectedItem!.id,
      image: pickedImage,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingItem = false;
      },
      (model) {
        message = model.message;
        checkUpdatingItem = true;
        onSelectItem(model.item);
        replaceItem(model.item);
      },
    );
    notifyListeners();
  }

  /// Replace item form the list with new item
  void replaceItem(AboutUsModel item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index != -1) items[index] = item;
    notifyListeners();
  }

  /// Delete Item
  bool? checkDeletingItem = false;

  Future<void> deleteItem() async {
    checkDeletingItem = null;
    notifyListeners();

    final result = await repo.deleteItem(id: selectedItem!.id);
    result.fold(
      (msg) {
        message = msg;
        checkDeletingItem = false;
      },
      (model) {
        message = model.message;
        checkDeletingItem = true;
        items.removeWhere((element) => element.id == selectedItem!.id);
        selectedItem = null;
        if (items.isNotEmpty) onSelectItem(items.first);
      },
    );
    notifyListeners();
  }
}
