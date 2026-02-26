import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/models/order_model.dart';
import '../../../../../core/models/trip/trip_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_email_field.dart';
import '../../../../../core/widgets/custom_name_field.dart';
import '../../../../../core/widgets/custom_phone_text_filed.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

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
                        labelText: S.of(context).firstName,
                        controller: TextEditingController(
                          text: userOrder.firstName,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomNameField(
                        labelText: S.of(context).lastName,
                        controller: TextEditingController(
                          text: userOrder.lastName,
                        ),
                      ),
                    ),
                  ],
                ),

                CustomEmailField(
                  labelText: S.of(context).email,
                  controller: TextEditingController(text: userOrder.email),
                ),

                CustomPhoneTextField(
                  labelText: S.of(context).phoneNumber,
                  controller: TextEditingController(text: userOrder.phone),
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: S.of(context).numberOfChildren,
                        controller: TextEditingController(
                          text: userOrder.numberOfChildren.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: S.of(context).numberOfAdults,
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
                        labelText: S.of(context).tripRegistrationDate,
                        prefixIcon: _Calender(),
                        controller: TextEditingController(
                          text: userOrder.startDate,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: S.of(context).departureDate,
                        prefixIcon: _Calender(),
                        controller: TextEditingController(
                          text: userOrder.endDate,
                        ),
                      ),
                    ),
                  ],
                ),

                CustomTextFormField(
                  labelText: S.of(context).inquiry,
                  lines: 5,
                  controller: TextEditingController(
                    text: userOrder.description,
                  ),
                ),

                // Row(
                //   children: [
                //     Expanded(
                //       child: CustomTextFormField(
                //         labelText: S.of(context).perPersonPrice,
                //         controller: TextEditingController(
                //           text: trip.price.toString(),
                //         ),
                //         suffixIcon: Icon(
                //           Icons.attach_money,
                //           color: AppColors.cyanGreen,
                //         ),
                //       ),
                //     ),

                //     Expanded(
                //       child: CustomTextFormField(
                //         labelText: S.of(context).totalPrice,
                //         controller: TextEditingController(
                //           text: (trip.userOrder?.totalPrice ?? 0).toString(),
                //         ),
                //         suffixIcon: Icon(
                //           Icons.attach_money,
                //           color: AppColors.cyanGreen,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
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
