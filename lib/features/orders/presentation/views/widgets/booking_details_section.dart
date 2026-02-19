import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/order_model.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class BookingDetailsSection extends StatelessWidget {
  const BookingDetailsSection({super.key, required this.trip});
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    OrderModel userOrder = trip.userOrder ?? OrderModel.empty();
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
                        controller: TextEditingController(
                          text: userOrder.firstName,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomNameField(
                        labelText: 'الإسم الثاني',
                        controller: TextEditingController(
                          text: userOrder.lastName,
                        ),
                      ),
                    ),
                  ],
                ),

                CustomEmailField(
                  labelText: 'البريد الإلكتروني',
                  controller: TextEditingController(text: userOrder.email),
                ),

                CustomPhoneTextField(
                  labelText: 'رقم الهاتف',
                  controller: TextEditingController(text: userOrder.phone),
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'عدد الأطفال',
                        controller: TextEditingController(
                          text: userOrder.numberOfChildren.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'عدد البالغين',
                        controller: TextEditingController(
                          text: userOrder.numberOfAdults.toString(),
                        ),
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
                          text: userOrder.startDate,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'تاريخ المغادرة',
                        prefixIcon: _Calender(),
                        controller: TextEditingController(
                          text: userOrder.endDate,
                        ),
                      ),
                    ),
                  ],
                ),

                CustomTextFormField(
                  labelText: 'ألاستفسار (الملاحظات)',
                  lines: 5,
                  controller: TextEditingController(
                    text: userOrder.description,
                  ),
                ),

                // TODO : show the correct price after added to the order model
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'سعر الفرد',
                        controller: TextEditingController(
                          text: trip.price.toString(),
                        ),
                        suffixIcon: Icon(
                          Icons.attach_money,
                          color: AppColors.cyanGreen,
                        ),
                      ),
                    ),

                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'السعر الإجمالي',
                        controller: TextEditingController(
                          text: trip.price.toString(),
                        ),
                        suffixIcon: Icon(
                          Icons.attach_money,
                          color: AppColors.cyanGreen,
                        ),
                      ),
                    ),
                  ],
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
