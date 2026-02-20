import 'package:flutter/material.dart';

import '../../../../../core/enums/trip_status.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/functions/toggle_trip_status.dart';

class SuspendedTripDetailsViewHeader extends StatelessWidget {
  const SuspendedTripDetailsViewHeader({super.key, required this.trip});
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      leadingWidth: 0,
      leading: const SizedBox(width: 0),
      backgroundColor: AppColors.white,
      flexibleSpace: Container(color: AppColors.white),
      toolbarHeight: 52,
      expandedHeight: 52,
      title: Row(
        spacing: 8,
        children: [
          // CustomButton(
          //   text: 'حذف الرحلة من النظام',
          //   color: AppColors.red,
          //   onPressed: () {
          //     DialogHelper.showQuestionDialog(
          //       context,
          //       title: 'تاكيد',
          //       desc: 'هل تريد حذف الرحلة من النظام؟',
          //       onOk: () {
          //         deleteTrip(context: context, id: trip.id);
          //       },
          //       onCancel: () {},
          //     );
          //   },
          // ),
          const Spacer(),
          CustomButton(
            text: 'تفعيل برنامج الرحلة',
            color: AppColors.cyanGreen,
            onPressed: () {
              DialogHelper.showQuestionDialog(
                context,
                title: 'تاكيد',
                desc: 'هل تريد تفعيل برنامج الرحلة',
                onOk: () {
                  toggleTripStatus(
                    context: context,
                    id: trip.id,
                    status: TripStatus.active,
                  );
                },
                onCancel: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
