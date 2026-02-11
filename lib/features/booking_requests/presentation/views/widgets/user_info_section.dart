import 'package:bedouin_trails_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_white_box.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: CustomWhiteBox(
        // borderColor: AppColors.white  ,
        showBorder: true,
        child: Column(
          spacing: 12,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'بيانات العميل :',
                    style: AppTextStyles.regular24(
                      context,
                    ).copyWith(fontFamily: Constants.vexaFontFamily),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.borderGrey, width: 2),
                image: const DecorationImage(
                  image: AssetImage(Assets.imagesTestUser),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomNameField(
                    labelText: 'الإسم الأول',
                    controller: TextEditingController(text: "خالد"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomNameField(
                    labelText: 'الإسم الثاني',
                    controller: TextEditingController(text: "محمد"),
                  ),
                ),
              ],
            ),

            CustomEmailField(
              labelText: 'البريد الإلكتروني',
              controller: TextEditingController(text: "zV2lM@example.com"),
            ),

            CustomPhoneTextField(
              labelText: 'رقم الهاتف',
              controller: TextEditingController(text: "01012345678"),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
