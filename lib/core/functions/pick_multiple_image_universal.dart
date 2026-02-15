library;

import 'dart:developer';

import 'package:file_picker/file_picker.dart';

import '../models/picked_image_model.dart';

/// Pick MULTIPLE images (Web + Mobile + Desktop)
/// Returns List<PickedImage>
/// Returns empty list if user cancels
///
Future<List<PickedImage>> pickMultipleImagesUniversal() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // 🔥 HERE IS THE DIFFERENCE
      withData: true, // VERY IMPORTANT for Flutter Web
    );

    if (result == null || result.files.isEmpty) {
      return [];
    }

    List<PickedImage> images = [];

    for (final file in result.files) {
      // some platforms may give null bytes if withData not enabled
      if (file.bytes == null) continue;

      images.add(PickedImage(bytes: file.bytes!, fileName: file.name));
    }

    return images;
  } catch (e) {
    log("Pick multiple images error: $e");
    return [];
  }
}
