import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trips_provider.dart';

class SearchTripsDurationButton extends StatelessWidget {
  const SearchTripsDurationButton({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TripsProvider>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150),
      child: CustomTextFormField(
        hintText: S.of(context).tripDuration,
        color: AppColors.white,
        showBorder: true,
        controller: prov.tripDurationController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          // if (prov.checkGetAllActiveTrips != null || value.isEmpty) {}
          prov.getAllActiveTrips();
        },
      ),
    );
  }
}
