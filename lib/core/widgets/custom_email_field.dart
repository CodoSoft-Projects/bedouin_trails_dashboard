import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomEmailField extends StatefulWidget {
  const CustomEmailField({
    super.key,
    this.hintText = 'الإيميل',
    this.controller,
    this.labelText = '',
  });
  final String labelText;
  final String hintText;
  final TextEditingController? controller;

  @override
  State<CustomEmailField> createState() => _CustomEmailFieldState();
}

class _CustomEmailFieldState extends State<CustomEmailField> {
  bool validEmail = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      labelText: widget.labelText,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => validatorOfEmail(value),
      onChanged: (value) {
        validEmail = validatorOfEmailBool(value);
        setState(() {});
      },
      prefixIcon: Icon(
        LucideIcons.mail,
        color: validEmail ? AppColors.blue : AppColors.black2,
      ),

      suffixIcon: Icon(
        LucideIcons.check600,
        color: validEmail ? AppColors.blue : AppColors.black2,
      ),
    );
  }
}
