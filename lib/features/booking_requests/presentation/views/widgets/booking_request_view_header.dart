import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import 'filter_requests_type_button.dart';
import 'requests_search_field.dart';

class BookingRequestViewHeader extends StatelessWidget {
  const BookingRequestViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var isMobile = SizeConfig.isMobile();
    return isMobile ? const _MobileLayout() : const _DesktopLayout();
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leadingWidth: 0,
      leading: const SizedBox(width: 0),
      backgroundColor: AppColors.white,
      flexibleSpace: Container(color: AppColors.white),
      toolbarHeight: 60,
      expandedHeight: 60,
      title: Row(
        spacing: 8,
        children: [
          FilterRequestsTypeButton(),
          const Spacer(),
          RequestsSearchField(),
          const Spacer(),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leadingWidth: 0,
      leading: const SizedBox(width: 0),
      backgroundColor: AppColors.white,
      flexibleSpace: Container(color: AppColors.white),
      toolbarHeight: 60,
      expandedHeight: 60,
      title: Row(
        spacing: 8,
        children: [
          FilterRequestsTypeButton(),
          Expanded(child: RequestsSearchField()),
        ],
      ),
    );
  }
}
