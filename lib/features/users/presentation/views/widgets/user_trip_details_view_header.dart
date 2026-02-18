import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/order_status.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../trips/presentation/manager/trips_provider.dart';

class UserTripDetailsViewHeader extends StatelessWidget {
  const UserTripDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    bool visible = prov.selectedTrip?.userOrder?.status == OrderStatus.pending;
    return Visibility.maintain(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CustomButton(
              text: 'إتمام دفع الحجز',
              color: AppColors.whiteGrey,
              textColor: AppColors.black,
              onPressed: () {},
            ),
            const Spacer(),
            CustomButton(
              text: 'رفض طلب الحجز',
              color: AppColors.whiteGrey,
              textColor: AppColors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
