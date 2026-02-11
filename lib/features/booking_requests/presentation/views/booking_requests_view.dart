import 'package:flutter/material.dart';

import 'widgets/booking_request_view_header.dart';
import 'widgets/booking_requests_grid_view.dart';

class BookingRequestsView extends StatelessWidget {
  const BookingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const BookingRequestViewHeader(),
        SliverToBoxAdapter(child: const BookingRequestsGridView()),
      ],
    );
  }
}
