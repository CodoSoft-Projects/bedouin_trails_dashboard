import 'package:flutter/material.dart';

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
        // const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
