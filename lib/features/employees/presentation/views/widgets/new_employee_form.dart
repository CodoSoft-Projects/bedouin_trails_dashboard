import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_white_box.dart';
import '../../../../../core/widgets/labeled_checkbox.dart';

class NewEmployeeForm extends StatelessWidget {
  const NewEmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 555),

          child: Column(
            spacing: 16,
            children: [
              const SizedBox(height: 8),
              _ProfileImage(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomNameField(
                      labelText: 'الإسم الأول',
                      hintText: 'الإسم الأول',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomNameField(
                      labelText: 'الإسم الثاني',
                      hintText: 'الإسم الثاني',
                    ),
                  ),
                ],
              ),

              CustomEmailField(
                labelText: 'البريد الإلكتروني',
                hintText: 'البريد الإلكتروني',
              ),

              CustomPhoneTextField(
                labelText: 'رقم الهاتف',
                hintText: 'رقم الهاتف',
              ),

              CustomPasswordField(
                labelText: 'كلمة المرور',
                hintText: 'كلمة المرور',
              ),

              _Permissions(),

              const SizedBox(height: 16),
              CustomButton(
                text: 'إضافة موظف',
                horizontalPadding: 75,
                color: AppColors.sandyBrown,
                onPressed: () {},
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

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
              // image: const DecorationImage(
              //   image: AssetImage(Assets.imagesTestUser),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Icon(LucideIcons.user, color: AppColors.sandyBrown),
          ),

          Positioned(
            bottom: 0,
            right: 32,
            child: CustomCircularButton(
              icon: LucideIcons.penLine,
              onPressed: () {},
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
            value: false,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة طلبات الحجز',
            value: false,
            onChanged: (value) {},
          ),
          LabeledCheckbox(
            labelText: 'إدارة الموقع الإلكتروني',
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
