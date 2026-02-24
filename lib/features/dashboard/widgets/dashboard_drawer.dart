import 'package:bedouin_trails_dashboard/core/widgets/custom_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/widgets/languages_dialog.dart';
import '../../notifications/presentation/views/widgets/notification_icon.dart';
import 'account_info_section.dart';
import 'dashboard_features_sliver_list.dart';
import 'logout_button.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteGrey,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      Row(
                        spacing: 16,
                        children: [
                          NotificationIcon(),
                          Expanded(child: AccountInfoSection()),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(color: AppColors.white),
                    ],
                  ),
                ),
              ),

              // MENU (Scrollable)
              const DashboardFeaturesSliverList(),

              // FOOTER (Pinned Bottom)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(color: AppColors.white),
                      SizedBox(height: 8),
                      Row(
                        spacing: 16,
                        children: [
                          CustomCircularButton(
                            icon: LucideIcons.globe,
                            borderSide: BorderSide.none,
                            onPressed: () {
                              languagesDialog(context);
                            },
                          ),
                          Expanded(child: LogoutButton()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
