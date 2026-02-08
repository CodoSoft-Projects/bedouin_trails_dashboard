import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/dialog_helper.dart';

class SuspendedTripDetailsViewHeader extends StatelessWidget {
  const SuspendedTripDetailsViewHeader({super.key});

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
            text: 'حذف الرحلة من النظام',
            color: AppColors.red,
            onPressed: () {
              DialogHelper.showQuestionDialog(
                context,
                title: 'تاكيد',
                desc: 'هل تريد حذف الرحلة من النظام؟',
                onOk: () {
                  Navigator.pop(context);

                  DialogHelper.showSuccessDialog(
                    context,
                    title: 'تم حذف الرحلة من النظام',
                  );
                },
                onCancel: () {},
              );
            },
          ),
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
                  Navigator.pop(context);
                  DialogHelper.showSuccessDialog(
                    context,
                    title: 'تم تفعيل برنامج الرحلة',
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
