import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../control_panel_provider.dart';

void getControlPanelData(BuildContext context) {
  context.read<ControlPanelProvider>().getControlPanelData();
}
