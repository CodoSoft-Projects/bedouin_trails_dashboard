// ignore_for_file: use_build_context_synchronously

import 'package:bedouin_trails_dashboard/core/enums/trip_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
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
          enabled: prov.checkGetTripDetails == null,
          child: Form(
            key: canEdit ? prov.formKey : null,
            child: Column(
              spacing: 12,
              children: [
                CustomTextFormField(
                  labelText: 'عنوان الرحلة',
                  validator: simpleValidation,
                  controller: canEdit
                      ? prov.tripNameController
                      : TextEditingController(text: trip.name),
                ),
                CustomDropdownTextField<TripStatus>(
                  labelText: 'حالة الحجز للرحلة',
                  value: prov.tripStatus,
                  items: [TripStatus.active, TripStatus.inactive],
                  itemLabel: (item) => item.arName,
                  onSelected: (value) {
                    if (value == null) return;
                    prov.tripStatus = value;
                  },
                  controller: TextEditingController(text: trip.status.arName),
                ),

                CustomTextFormField(
                  labelText: 'سعر الرحلة',
                  controller: canEdit
                      ? prov.tripPriceController
                      : TextEditingController(text: trip.price.toString()),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: priceValidation,
                  suffixIcon: Icon(
                    Icons.attach_money,
                    color: AppColors.cyanGreen,
                  ),
                ),

                CustomTextFormField(
                  labelText: 'نقطة بداية الرحلة',
                  validator: simpleValidation,
                  controller: canEdit
                      ? prov.tripFromController
                      : TextEditingController(text: trip.interfaceFrom),
                ),

                CustomTextFormField(
                  labelText: 'نقطة نهاية الرحلة',
                  validator: simpleValidation,
                  controller: canEdit
                      ? prov.tripToController
                      : TextEditingController(text: trip.interfaceTo),
                ),
                const SizedBox(height: 24),
                if (canEdit)
                  CustomButton(
                    text: 'حفظ التعديلات',
                    color: AppColors.sandyBrown,
                    horizontalPadding: 42,
                    onPressed: () async {
                      if (prov.formKey.currentState!.validate()) {
                        //* Show loading dialog
                        loadingDialog(context);

                        await prov.updateTrip();

                        //* Close loading dialog
                        Navigator.pop(context);

                        if (prov.checkUpdateTrip == true) {
                          Navigator.pop(context);

                          AppMessage.successBar(context, message: prov.message);
                        } else if (prov.checkUpdateTrip == false) {
                          AppMessage.errorBar(context, message: prov.message);
                        }
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
