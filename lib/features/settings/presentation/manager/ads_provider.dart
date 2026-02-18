import 'package:flutter/material.dart';

import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../data/models/settings_item_model.dart';
import '../../data/repos/ads_repo.dart';

class AdsProvider extends ChangeNotifier {
  AdsRepo repo = AdsRepo();

  String message = '';

  List<SettingsItemModel> adsItems = [];
  SettingsItemModel? selectedItem;
  PickedImage? pickedImage;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  /// Get All Ads
  bool? checkGettingAds = false;

  Future<void> getAllAds() async {
    checkGettingAds = null;
    notifyListeners();

    final result = await repo.getAllAds();
    result.fold(
      (msg) {
        message = msg;
        checkGettingAds = false;
      },
      (model) {
        adsItems = model.items;
        if (adsItems.isNotEmpty) onSelectAdsItem(adsItems.first);
        message = model.message;
        checkGettingAds = true;
      },
    );
    notifyListeners();
  }

  void fillControllers(SettingsItemModel? item) {
    var adsItem = item ?? selectedItem;
    titleController.text = adsItem!.title;
    descriptionController.text = adsItem.description;
    notifyListeners();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  void onSelectAdsItem(SettingsItemModel item) {
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

    final result = await repo.addNewAdsItem(
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
        getAllAds();
      },
    );
    notifyListeners();
  }

  /// Update Ads
  bool? checkUpdatingAdsItem = false;

  Future<void> updateAdsItem() async {
    checkUpdatingAdsItem = null;
    notifyListeners();

    final result = await repo.updateAdsItem(
      id: selectedItem!.id,
      image: pickedImage,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingAdsItem = false;
      },
      (model) {
        message = model.message;
        checkUpdatingAdsItem = true;
        onSelectAdsItem(model.item);
        replaceAdsItem(model.item);
      },
    );
    notifyListeners();
  }

  /// Replace ads item form the list with new ads item
  void replaceAdsItem(SettingsItemModel item) {
    final index = adsItems.indexWhere((element) => element.id == item.id);
    if (index != -1) adsItems[index] = item;
    notifyListeners();
  }

  /// Delete Ads Item
  bool? checkDeletingAdsItem = false;

  Future<void> deleteAdsItem() async {
    checkDeletingAdsItem = null;
    notifyListeners();

    final result = await repo.deleteAdsItem(id: selectedItem!.id);
    result.fold(
      (msg) {
        message = msg;
        checkDeletingAdsItem = false;
      },
      (model) {
        message = model.message;
        checkDeletingAdsItem = true;
        adsItems.removeWhere((element) => element.id == selectedItem!.id);
        selectedItem = null;
        if (adsItems.isNotEmpty) onSelectAdsItem(adsItems.first);
      },
    );
    notifyListeners();
  }
}
