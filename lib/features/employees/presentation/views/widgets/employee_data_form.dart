import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/labeled_checkbox.dart';

class EmployeeDataForm extends StatelessWidget {
  const EmployeeDataForm({super.key, required this.canEdit});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AbsorbPointer(
        absorbing: !canEdit,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 555),

            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 8),
                _ProfileImage(canEdit: canEdit),
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

                CustomPasswordField(
                  labelText: 'كلمة المرور',
                  controller: TextEditingController(text: "12345678"),
                ),

                _Permissions(),
                if (canEdit) ...[
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'حفظ التعديلات',
                    horizontalPadding: 75,
                    color: AppColors.sandyBrown,
                    onPressed: () {},
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({required this.canEdit});
  final bool canEdit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
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
            child: Icon(LucideIcons.user, color: AppColors.sandyBrown),
          ),

          Visibility(
            visible: canEdit,
            child: Positioned(
              bottom: 0,
              right: 32,
              child: CustomCircularButton(
                icon: LucideIcons.penLine,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Permissions extends StatelessWidget {
  const _Permissions();

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBox(
      color: AppColors.whiteGrey,
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Text(
                'الدور الوظيفي',
                style: AppTextStyles.medium18(
                  context,
                ).copyWith(color: AppColors.blue),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LabeledCheckbox(
            labelText: 'إدارة الرحلات السياحية',
            value: false,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة الرحلات الموقوفة',
            value: false,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة المستخدمين',
            value: true,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة طلبات الحجز',
            value: false,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة الموقع الإلكتروني',
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
