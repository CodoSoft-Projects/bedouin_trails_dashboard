import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({
    super.key,
    this.hintText = 'رقم الجوال',
    this.controller,
    this.labelText = '',
  });
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  bool validPhone = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      labelText: widget.labelText,
      keyboardType: TextInputType.phone,
      prefixIcon: Icon(
        Icons.phone,
        color: validPhone ? AppColors.blue : AppColors.phosphorBlue,
      ),
      suffixIcon: Icon(
        LucideIcons.check600,
        color: validPhone ? AppColors.blue : AppColors.phosphorBlue,
      ),
      validator: (value) => validatorOfEgyptianPhone(value),
      onChanged: (value) {
        validPhone = validatorOfEgyptianPhoneBool(value);
        setState(() {});
      },
    );
  }
}
