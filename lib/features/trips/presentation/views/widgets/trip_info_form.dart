import 'package:bedouin_trails_dashboard/core/enums/trip_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/trips_provider.dart';

class TripInfoForm extends StatelessWidget {
  const TripInfoForm({super.key, this.canEdit = true, required this.trip});
  final bool canEdit;
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AbsorbPointer(
        absorbing: !canEdit,
        child: Skeletonizer(
          enabled: context.watch<TripsProvider>().checkGetTripDetails == null,
          child: Column(
            spacing: 12,
            children: [
              CustomTextFormField(
                labelText: 'عنوان الرحلة',
                controller: !canEdit
                    ? prov.tripNameController
                    : TextEditingController(text: trip.name),
              ),
              CustomDropdownTextField<TripStatus>(
                labelText: 'حالة الحجز للرحلة',
                // value: prov.tripStatusController?.arName ?? TripStatus,
                items: [TripStatus.active, TripStatus.inactive],
                itemLabel: (item) => item.arName,
                controller: !canEdit
                    ? TextEditingController(text: prov.tripStatus.arName)
                    : TextEditingController(text: trip.status.arName),
              ),

              CustomTextFormField(
                labelText: 'سعر الرحلة',
                controller: TextEditingController(text: trip.price.toString()),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال سعر الرحلة';
                  }
                  if (value.length > 8) {
                    return 'يجب ان يكون سعر الرحلة اقل من 8 رقم';
                  }
                  return null;
                },
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
