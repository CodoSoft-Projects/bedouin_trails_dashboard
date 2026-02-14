import 'package:flutter/material.dart';

import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../update_trip_view.dart';

class TripDetailsViewHeader extends StatelessWidget {
  const TripDetailsViewHeader({super.key, required this.trip});
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
          CustomButton(
            text: 'تعديل بيانات الرحلة',
            color: AppColors.whiteGrey,
            textColor: AppColors.black,
            onPressed: () {
              Navigator.of(context).pushNamed(UpdateTripView.routeName);
            },
          ),
          const Spacer(),
          CustomButton(
            text: 'إيقاف برنامج الرحلة',
            color: AppColors.red,
            onPressed: () {
              DialogHelper.showQuestionDialog(
                context,
                title: 'تاكيد',
                desc: 'هل تريد ايقاف برنامج الرحلة',
                onOk: () {
                  DialogHelper.showSuccessDialog(
                    context,
                    title: 'تم ايقاف الرحلة',
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
