import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class TripInfoForm extends StatelessWidget {
  const TripInfoForm({super.key, this.canEdit = true});
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AbsorbPointer(
        absorbing: !canEdit,
        child: Form(
          child: Column(
            spacing: 12,
            children: [
              CustomTextFormField(
                labelText: 'عنوان الرحلة',
                controller: TextEditingController(text: 'SIWA SAFARI TOUR'),
              ),

              CustomTextFormField(
                labelText: 'حالة الحجز للرحلة',
                controller: TextEditingController(text: 'متاح'),
              ),

              CustomTextFormField(
                labelText: 'سعر الرحلة',
                controller: TextEditingController(text: '1000'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                suffixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.cyanGreen,
                ),
              ),

              CustomTextFormField(
                labelText: 'نقطة بداية الرحلة',
                controller: TextEditingController(text: 'واحة سيوة'),
              ),

              CustomTextFormField(
                labelText: 'نقطة نهاية الرحلة',
                controller: TextEditingController(text: 'الكثبان البضاء'),
              ),
              const SizedBox(height: 24),
              if (canEdit)
                CustomButton(
                  text: 'حفظ التعديلات',
                  color: AppColors.sandyBrown,
                  horizontalPadding: 42,
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
