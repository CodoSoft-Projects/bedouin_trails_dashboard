import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'ads_view.dart';
import 'questions_view.dart';
import 'widgets/settings_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Divider(thickness: 1, height: 1, color: AppColors.borderGrey),
        SettingsButton(
          text: 'إدارة إعلان الموقع',
          routeName: AdsView.routeName,
        ),
        SettingsButton(
          text: 'إدارة الأسئلة الشائعة',
          routeName: QuestionsView.routeName,
        ),
        SettingsButton(text: 'إدارة المقالات', routeName: null),
      ],
    );
  }
}
