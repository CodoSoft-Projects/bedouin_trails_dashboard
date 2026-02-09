import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class BookingDetailsSection extends StatelessWidget {
  const BookingDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AbsorbPointer(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 555),

            child: Column(
              spacing: 16,
              children: [
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

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'عدد الأطفال',
                        controller: TextEditingController(text: "5"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'عدد البالغين',
                        controller: TextEditingController(text: "7"),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'تاريخ تسجيل الرحلة',
                        prefixIcon: _Calender(),
                        controller: TextEditingController(
                          text: "08 - 02 - 2026",
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'تاريخ المغادرة',
                        prefixIcon: _Calender(),
                        controller: TextEditingController(
                          text: "12 - 02 - 2026",
                        ),
                      ),
                    ),
                  ],
                ),

                CustomTextFormField(
                  labelText: 'ألاستفسار (الملاحظات)',
                  lines: 5,
                  controller: TextEditingController(text: "لاستفسار"),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Calender extends StatelessWidget {
  const _Calender();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      LucideIcons.calendarDays,
      color: AppColors.black2,
      size: 18,
    );
  }
}
