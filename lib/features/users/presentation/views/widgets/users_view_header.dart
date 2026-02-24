import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/users_provider.dart';

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
        children: [const Spacer(), _UsersSearchField(), const Spacer()],
      ),
    );
  }
}

class _UsersSearchField extends StatelessWidget {
  const _UsersSearchField();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UsersProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: CustomSearchField(
        hintText: S.of(context).search,
        controller: prov.searchController,
        onChanged: (value) {
          prov.getAllUsers();
        },
      ),
    );
  }
}
