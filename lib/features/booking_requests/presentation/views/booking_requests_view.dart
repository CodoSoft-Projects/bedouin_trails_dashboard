import 'package:flutter/material.dart';

class BookingRequestsView extends StatelessWidget {
  const BookingRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [const SliverToBoxAdapter(child: SizedBox(height: 12))],
    );
  }
}
