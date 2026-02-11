import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key, this.canEdit = false});
  final bool canEdit;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            children: [
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
                controller: TextEditingController(text: "wFb6y@example.com"),
              ),

              CustomPhoneTextField(
                labelText: 'رقم الجوال',
                controller: TextEditingController(text: "+20 10987654345"),
              ),

              const SizedBox(height: 24),
              if (canEdit)
                CustomButton(
                  text: 'حفظ التغييرات',
                  color: AppColors.sandyBrown,
                  horizontalPadding: 72,
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
