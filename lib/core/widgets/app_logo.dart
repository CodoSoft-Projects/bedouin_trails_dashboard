import 'package:flutter/material.dart';

import '../utils/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imagesLogo, height: 60, width: 120);
  }
}
