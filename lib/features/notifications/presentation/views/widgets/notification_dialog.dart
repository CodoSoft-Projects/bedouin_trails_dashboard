import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_dialog.dart';

void notificationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(maxWidth: 350, content: _Content());
    },
  );
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesTestUser),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'خالد ابن سلمان',
            style: AppTextStyles.regular16(context),
          ),
          trailing: Text(
            '11 يناير 2026',
            style: AppTextStyles.regular16(context),
          ),
        ),
        const SizedBox(width: 300),

        Text(
          'ود الإفادة بوجود مشكلة في يوم تسليم جلسة التصوير المتفق عليه، حيث لم يتم التسليم في الموعد المحدد دون إشعار مسبق. نرجو توضيح سبب التأخير وتحديد موعد جديد للتسليم في أقرب وقت ممكن، شاكرين تعاونكم.',
          textAlign: TextAlign.center,
          style: AppTextStyles.regular16(context),
        ),
      ],
    );
  }
}
