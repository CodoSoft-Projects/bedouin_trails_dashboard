import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_pagination.dart';
import '../manager/trips_provider.dart';
import 'widgets/trips_grid_view.dart';
import 'widgets/trips_view_header.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const TripsViewHeader(),
        // const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SliverToBoxAdapter(child: TripsGridView()),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
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
    var prov = context.watch<TripsProvider>();
    return SliverToBoxAdapter(
      child: prov.checkGetAllActiveTrips == false
          ? SizedBox()
          : CustomPagination(
              currentPage: prov.pagination.currentPage,
              totalPages: prov.pagination.lastPage,
              onPageChanged: (page) {
                prov.getAllActiveTrips(page: page);
              },
            ),
    );
  }
}
