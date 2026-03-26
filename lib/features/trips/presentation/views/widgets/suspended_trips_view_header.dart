import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';

class SuspendedTripsViewHeader extends StatelessWidget {
  const SuspendedTripsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = SizeConfig.isMobile();
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
          if (!isMobile) const Spacer(),
          if (isMobile)
            Expanded(child: _TripsSearchField())
          else
            _TripsSearchField(),

          if (!isMobile) const Spacer(),
        ],
      ),
    );
  }
}

class _TripsSearchField extends StatelessWidget {
  const _TripsSearchField();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(
        hintText: S.of(context).searchTrip,
        controller: prov.inactiveTripSearchController,
        onChanged: (value) {
          log(value);
          // if (prov.checkGetAllActiveTrips != null || value.isEmpty) {}
          prov.getAllInactiveTrips();
        },
      ),
    );
  }
}
