import 'package:flutter/material.dart';

import 'widgets/trips_view_header.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const TripsViewHeader(),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
