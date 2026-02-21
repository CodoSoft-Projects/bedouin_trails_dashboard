import 'package:flutter/material.dart';

import '../../data/models/control_panel_model.dart';
import '../../data/repo/control_panel_repo.dart';

class ControlPanelProvider extends ChangeNotifier {
  ControlPanelRepo repo = ControlPanelRepo();
  ControlPanelModel controlPanelData = ControlPanelModel.empty();

  String message = '';
  bool? checkGetting = false;

  /// Get Control Panel Data
  Future<void> getControlPanelData() async {
    checkGetting = null;
    notifyListeners();

    final result = await repo.getControlPanelData();
    result.fold(
      (msg) {
        message = msg;
        checkGetting = false;
      },
      (model) {
        message = model.message;
        checkGetting = true;
        controlPanelData = model.data;
      },
    );
    notifyListeners();
  }
}
