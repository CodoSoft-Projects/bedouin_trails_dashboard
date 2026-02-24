// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/functions/loading_dialog.dart';
import '../../../../../core/functions/validation_of_input_fields.dart';
import '../../../../../core/helpers/app_message.dart';
import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/models/trip/trip_day_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';
import 'empty_cart_image.dart';

Future<dynamic> addNewTripProgramCartDialog(
  BuildContext context, {
  required int nextCardIdx,
  required TripDayModel day,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomDialog(
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: CustomInfoField(
                    color: AppColors.whiteGrey,
                    title: 'اليوم',
                    subtitle: day.dayNumber.toString(),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: CustomInfoField(
                    color: AppColors.whiteGrey,
                    title: 'البطاقة',
                    subtitle: nextCardIdx.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(width: 700, height: 16),
            _Content(day: day),
          ],
        ),
      );
    },
  );
}

class _Content extends StatelessWidget {
  const _Content({required this.day});
  final TripDayModel day;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderGrey),
              image: prov.cartImage == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(prov.cartImage!.bytes),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Visibility(
                  visible: prov.cartImage == null,
                  child: EmptyCartImage(),
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomCircularButton(
                      icon: LucideIcons.upload,
                      backgroundColor: AppColors.whiteGrey,
                      onPressed: () {
                        prov.uploadCartImage();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(flex: 3, child: NewCartForm(day: day)),
      ],
    );
  }
}

class NewCartForm extends StatelessWidget {
  const NewCartForm({super.key, required this.day});
  final TripDayModel day;

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return Form(
      key: prov.cartFormKey,
      child: Column(
        spacing: 8,
        children: [
          const _BlueLable(lable: 'عنوان البطاقة :'),
          CustomTextFormField(
            hintText: 'العنوان',
            validator: (value) => simpleValidation(context, value),

            controller: prov.cartTitleController,
          ),

          const _BlueLable(lable: 'وصف برنامج البطاقة :'),
          CustomTextFormField(
            hintText: 'الوصف',
            validator: (value) => simpleValidation(context, value),

            controller: prov.cartDescriptionController,
            lines: 8,
          ),

          const SizedBox(height: 16),
          CustomButton(
            text: 'حفظ',
            horizontalPadding: 75,
            color: AppColors.sandyBrown,
            onPressed: () async {
              if (prov.cartFormKey.currentState!.validate()) {
                if (prov.cartImage == null) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: "يجب اضافة صورة للبطاقة",
                  );
                  return;
                }
                //* Show Loading Dialog
                loadingDialog(context);

                await prov.addCartToTripDay(tripDayId: day.id);
                // close loading dialog
                Navigator.pop(context);

                if (prov.checkAddingCart == true) {
                  // close dialog
                  Navigator.pop(context);

                  AppMessage.successBar(context, message: prov.message);
                } else if (prov.checkAddingCart == false) {
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: prov.message,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class _BlueLable extends StatelessWidget {
  const _BlueLable({required this.lable});
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lable,
          style: AppTextStyles.regular16(
            context,
          ).copyWith(color: AppColors.blue),
        ),
      ],
    );
  }
}
