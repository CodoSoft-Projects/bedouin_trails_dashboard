import 'package:flutter/material.dart';

import '../../../../../core/models/trip/trip_card_model.dart';
import 'trip_program_cart_item.dart';

class TripProgramListView extends StatelessWidget {
  const TripProgramListView({
    super.key,
    this.canEdit = false,
    required this.cards,
  });
  final bool canEdit;
  final List<TripCardModel> cards;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return TripProgramCartItem(canEdit: canEdit);
      },
    );
  }
}
