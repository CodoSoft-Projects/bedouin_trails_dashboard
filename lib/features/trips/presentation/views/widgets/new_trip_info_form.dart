// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../control_panel/presentation/manager/functions/get_data_method.dart';
import '../../manager/trips_provider.dart';
import '../update_trip_view.dart';

class NewTripInfoForm extends StatelessWidget {
  const NewTripInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Form(
        key: prov.newTripFormKey,
        child: Column(
          spacing: 12,
          children: [
            CustomTextFormField(
              labelText: 'عنوان الرحلة',
              validator: (value) => simpleValidation(context, value),
              controller: prov.tripNameController,
            ),

            // CustomDropdownTextField(
            //   labelText: 'حالة الحجز للرحلة',
            //   items: const ['متاح', 'غير متاح'],
            //   itemLabel: (item) => item,
            //   // controller: TextEditingController(text: 'متاح'),
            // ),
            CustomTextFormField(
              labelText: 'سعر الرحلة',
              validator: (value) => priceValidation(context, value),
              controller: prov.tripPriceController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffixIcon: Icon(Icons.attach_money, color: AppColors.cyanGreen),
            ),

            CustomTextFormField(
              labelText: 'نقطة بداية الرحلة',
              validator: (value) => simpleValidation(context, value),
              controller: prov.tripFromController,
            ),

            CustomTextFormField(
              labelText: 'نقطة نهاية الرحلة',
              validator: (value) => simpleValidation(context, value),

              controller: prov.tripToController,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'حفظ',
              color: AppColors.sandyBrown,
              horizontalPadding: 42,
              onPressed: () async {
                if (prov.newTripFormKey.currentState!.validate()) {
                  if (prov.tripImages.isEmpty) {
                    AppMessage.errorBar(
                      context,
                      message: 'يجب إضافة صور للرحلة',
                    );
                    return;
                  }

                  //* Show loading dialog
                  loadingDialog(context);

                  await prov.addNewTrip();

                  //* Close loading dialog
                  Navigator.pop(context);

                  if (prov.checkAddingTrip == true) {
                    getControlPanelData(context);

                    //* Go to UpdateTripView to complete the trip information
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(UpdateTripView.routeName);

                    AppMessage.successBar(context, message: prov.message);
                  } else if (prov.checkAddingTrip == false) {
                    AppMessage.errorBar(context, message: prov.message);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
