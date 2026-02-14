import 'package:bedouin_trails_dashboard/core/enums/trip_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class TripInfoForm extends StatelessWidget {
  const TripInfoForm({super.key, this.canEdit = true, required this.trip});
  final bool canEdit;
  final TripModel trip;

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
                controller: TextEditingController(text: trip.name),
              ),

              CustomTextFormField(
                labelText: 'حالة الحجز للرحلة',
                controller: TextEditingController(text: trip.status.arName),
              ),

              CustomTextFormField(
                labelText: 'سعر الرحلة',
                controller: TextEditingController(text: trip.price.toString()),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                suffixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.cyanGreen,
                ),
              ),

              CustomTextFormField(
                labelText: 'نقطة بداية الرحلة',
                controller: TextEditingController(text: trip.interfaceFrom),
              ),

              CustomTextFormField(
                labelText: 'نقطة نهاية الرحلة',
                controller: TextEditingController(text: trip.interfaceTo),
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
