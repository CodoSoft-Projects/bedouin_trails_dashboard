import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets.dart';

class LoadingIconWidget extends StatelessWidget {
  const LoadingIconWidget({super.key, this.lottie});
  final String? lottie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Lottie.asset(lottie ?? Assets.animationsLoadingLottie2),
    );
  }
}
