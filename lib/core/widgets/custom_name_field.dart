import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomNameField extends StatefulWidget {
  const CustomNameField({
    super.key,
    this.hintText = 'الإسم',
    this.controller,
    this.labelText = '',
  });

  final String hintText;
  final TextEditingController? controller;
  final String labelText;

  @override
  State<CustomNameField> createState() => _CustomNameFieldState();
}

class _CustomNameFieldState extends State<CustomNameField> {
  bool validName = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      labelText: widget.labelText,
      keyboardType: TextInputType.name,
      validator: (value) => validatorOfUserName(value),
      onChanged: (value) {
        validName = validatorOfUserNameBool(value);
        setState(() {});
      },
      prefixIcon: Icon(
        Icons.person,
        color: validName ? AppColors.blue : AppColors.black2,
      ),
      suffixIcon: Icon(
        LucideIcons.check600,
        color: validName ? AppColors.blue : AppColors.black2,
      ),
    );
  }
}
