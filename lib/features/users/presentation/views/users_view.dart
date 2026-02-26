import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_pagination.dart';
import '../manager/users_provider.dart';
import 'widgets/users_grid_view.dart';
import 'widgets/users_view_header.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const UsersViewHeader(),
        const SliverToBoxAdapter(child: UsersGridView()),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(child: SizedBox(height: 12)),
              Row(children: [Expanded(child: _Pagination())]),
              SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UsersProvider>();
    return prov.checkGettingAllUser == false
        ? SizedBox()
        : CustomPagination(
            currentPage: prov.pagination.currentPage,
            totalPages: prov.pagination.lastPage,
            onPageChanged: (page) {
              prov.getAllUsers(page: page);
            },
          );
  }
}
