import 'package:flutter/material.dart';

import 'trip_program_cart_item.dart';

class TripProgramListView extends StatelessWidget {
  const TripProgramListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return const TripProgramCartItem();
      },
    );
  }
}
