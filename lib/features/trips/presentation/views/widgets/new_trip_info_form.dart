import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class NewTripInfoForm extends StatelessWidget {
  const NewTripInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Form(
        child: Column(
          spacing: 12,
          children: [
            CustomTextFormField(
              labelText: 'عنوان الرحلة',
              // controller: TextEditingController(text: 'SIWA SAFARI TOUR'),
            ),

            CustomDropdownTextField(
              labelText: 'حالة الحجز للرحلة',
              items: const ['متاح', 'غير متاح'],
              itemLabel: (item) => item,
              // controller: TextEditingController(text: 'متاح'),
            ),

            CustomTextFormField(
              labelText: 'سعر الرحلة',
              // controller: TextEditingController(text: '1000'),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffixIcon: Icon(Icons.attach_money, color: AppColors.cyanGreen),
            ),

            CustomTextFormField(
              labelText: 'نقطة بداية الرحلة',
              // controller: TextEditingController(text: 'واحة سيوة'),
            ),

            CustomTextFormField(
              labelText: 'نقطة نهاية الرحلة',
              // controller: TextEditingController(text: 'الكثبان البضاء'),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'حفظ',
              color: AppColors.sandyBrown,
              horizontalPadding: 42,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
