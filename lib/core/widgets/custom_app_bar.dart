import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/constants.dart';
import 'app_logo.dart';
import 'custom_circular_button.dart';

AppBar customAppBar(
  BuildContext context, {
  String title = '',
  Widget? titleWidgt,
  bool showBack = true,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    backgroundColor: AppColors.white,
    flexibleSpace: Container(color: AppColors.white),
    bottom: bottom,
    leading: showBack
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCircularButton(
              icon: Icons.arrow_back_ios_new,
              onPressed: () => Navigator.pop(context),
              borderSide: BorderSide.none,
            ),
          )
        : const SizedBox(width: 0),

    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppLogo(),
      ),
    ],
    centerTitle: false,
    title:
        titleWidgt ??
        Text(
          title,
          style: AppTextStyles.regular24(
            context,
          ).copyWith(fontFamily: Constants.vexaFontFamily),
        ),
  );
}
