import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_pagination.dart';
import '../manager/trips_provider.dart';
import 'widgets/suspended_trips_grid_view.dart';
import 'widgets/suspended_trips_view_header.dart';

class SuspendedTripsView extends StatelessWidget {
  const SuspendedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SuspendedTripsViewHeader(),
        // const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SliverToBoxAdapter(child: SuspendedTripsGridView()),
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
      child: prov.checkGetAllInactiveTrips == false
          ? SizedBox()
          : CustomPagination(
              currentPage: prov.inactivePagination.currentPage,
              totalPages: prov.inactivePagination.lastPage,
              onPageChanged: (page) {
                prov.getAllInactiveTrips(page: page);
              },
            ),
    );
  }
}
