import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import 'add_new_trip_button.dart';
import 'search_trips_duration_button.dart';
import 'trips_search_field.dart';

class TripsViewHeader extends StatelessWidget {
  const TripsViewHeader({super.key});

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
          SearchTripsDurationButton(),
          const Spacer(),
          TripsSearchField(),
          const Spacer(),
          AddNewTripButton(),
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
      toolbarHeight: 110,
      expandedHeight: 110,
      title: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 8,
            children: [
              SearchTripsDurationButton(),
              const Spacer(),
              AddNewTripButton(),
            ],
          ),
          Row(children: [Expanded(child: TripsSearchField())]),
        ],
      ),
    );
  }
}
