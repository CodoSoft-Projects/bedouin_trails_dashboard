import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/utils/constants.dart';
import '../enum/dashboard_type.dart';
import '../providers/dashboard_manager.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isDesktop = SizeConfig.isDesktop();
    var prov = context.watch<DashboardManager>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              onPressed: () {
                prov.openDrawer();
              },
              icon: const Icon(Icons.menu, color: AppColors.black),
            ),
          // NotificationIcon(color: AppColors.black),
          const SizedBox(width: 8),
          // LanguageIconButton(color: AppColors.black),
          Expanded(
            child: Text(
              prov.currentView?.label(context) ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular24(
                context,
              ).copyWith(fontFamily: Constants.vexaFontFamily),
            ),
          ),
          AppLogo(),
        ],
      ),
    );
  }
}
