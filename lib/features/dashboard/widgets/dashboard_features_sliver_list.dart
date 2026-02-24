import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/functions/is_arabic.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../enum/dashboard_type.dart';
import '../providers/dashboard_manager.dart';

class DashboardFeaturesSliverList extends StatelessWidget {
  const DashboardFeaturesSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<DashboardManager>();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: prov.dashboardTypes.length,
        (context, index) {
          final viewType = prov.dashboardTypes[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                right: isArabic()
                    ? selectedBorder(prov, viewType)
                    : BorderSide.none,
                left: isArabic()
                    ? BorderSide.none
                    : selectedBorder(prov, viewType),
              ),
              color: prov.currentView == viewType
                  // ignore: deprecated_member_use
                  ? AppColors.phosphorBlue.withOpacity(0.32)
                  : Colors.transparent,
            ),
            child: ListTile(
              leading: Icon(viewType.icon),
              title: Text(
                viewType.label(context),
                style: AppTextStyles.regular18(context),
              ),
              onTap: () => prov.changeView(viewType),
            ),
          );
        },
      ),
    );
  }

  BorderSide selectedBorder(DashboardManager prov, DashboardType viewType) {
    return BorderSide(
      width: 4,
      color: prov.currentView == viewType
          ? AppColors.white
          : Colors.transparent,
    );
  }
}
