import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../widgets/loading_icon_widget.dart';

Future<dynamic> loadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: LoadingIconWidget(lottie: Assets.animationsLoadingLottie),
        ),
      );
    },
  );
}
