import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_pagination.dart';
import '../manager/orders_provider.dart';
import 'widgets/orders_grid_view.dart';
import 'widgets/orders_view_header.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const OrdersViewHeader(),
        const SliverToBoxAdapter(child: OrdersGridView()),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: SizedBox(height: 12),
        ),
        const _Pagination(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<OrdersProvider>();
    return SliverToBoxAdapter(
      child: prov.checkGettingAllUser == false
          ? SizedBox()
          : CustomPagination(
              currentPage: prov.pagination.currentPage,
              totalPages: prov.pagination.lastPage,
              onPageChanged: (page) {
                prov.getAllOrdersUsers(page: page);
              },
            ),
    );
  }
}
