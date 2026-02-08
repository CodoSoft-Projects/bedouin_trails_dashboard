import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_search_field.dart';

class UsersViewHeader extends StatelessWidget {
  const UsersViewHeader({super.key});

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
        children: [const Spacer(), _TripsSearchField(), const Spacer()],
      ),
    );
  }
}

class _TripsSearchField extends StatelessWidget {
  const _TripsSearchField();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(onChanged: (value) {}),
    );
  }
}
