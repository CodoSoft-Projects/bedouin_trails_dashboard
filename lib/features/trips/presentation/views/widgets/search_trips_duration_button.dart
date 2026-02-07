import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SearchTripsDurationButton extends StatelessWidget {
  const SearchTripsDurationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150),
      child: CustomTextFormField(
        hintText: 'مدة الرحلة (يوم)',
        color: AppColors.white,
        showBorder: true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {},
      ),
    );
  }
}
