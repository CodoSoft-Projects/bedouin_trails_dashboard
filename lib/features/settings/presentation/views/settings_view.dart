import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'about_us_view.dart';
import 'ads_view.dart';
import 'articles_view.dart';
import 'questions_view.dart';
import 'widgets/settings_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Divider(thickness: 1, height: 1, color: AppColors.borderGrey),
        SettingsButton(
          text: S.of(context).manageSiteAdvertisement,
          routeName: AdsView.routeName,
        ),
        SettingsButton(
          text: S.of(context).manageFAQ,
          routeName: QuestionsView.routeName,
        ),
        SettingsButton(
          text: S.of(context).manageArticles,
          routeName: ArticlesView.routeName,
        ),
        SettingsButton(
          text: S.of(context).manageAboutUsPage,
          routeName: AboutUsView.routeName,
        ),
      ],
    );
  }
}
