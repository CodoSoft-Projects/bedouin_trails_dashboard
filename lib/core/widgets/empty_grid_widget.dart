import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_text_styles.dart';
import '../utils/assets.dart';
import '../utils/constants.dart';

class EmptyGridWidget extends StatelessWidget {
  const EmptyGridWidget({
    super.key,
    this.lottie,
    this.message = '',
    this.repeat = false,
  });
  final String? lottie;
  final String message;
  final bool repeat;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottie ?? Assets.animationsImageNotPreview,
            height: 300,
            repeat: repeat,
          ),

          if (message.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular24(
                context,
              ).copyWith(fontFamily: Constants.vexaFontFamily),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}
