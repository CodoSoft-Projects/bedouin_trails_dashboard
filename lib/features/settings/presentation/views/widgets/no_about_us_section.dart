// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/about_us_provider.dart';
import 'add_about_us_item_dialog.dart';

class NoAboutUsSection extends StatelessWidget {
  const NoAboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context); // localization shortcut
    var prov = context.read<AboutUsProvider>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// icon container
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.business_rounded,
                size: 60,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 24),

            /// title
            Text(
              s.no_about_title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            /// description
            Text(
              s.no_about_description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 28),

            /// button
            SizedBox(
              width: 220,
              height: 48,
              child: CustomButton(
                color: AppColors.sandyBrown,
                onPressed: () {
                  prov.clearControllers();
                  addAboutUsItemDialog(context);
                },
                icon: const Icon(Icons.add),
                text: s.add_about_btn,
              ),
            ),

            const SizedBox(height: 16),

            /// Refresh
            TextButton.icon(
              onPressed: () {
                prov.getAllItems();
              },
              icon: const Icon(Icons.refresh),
              label: Text(s.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
