import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../functions/validation_of_input_fields.dart';
import '../utils/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.hintText = '',
    this.controller,
    this.labelText = '',
  });
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool obscureText = true, validPassword = false;

  void setObscure(bool obscure) => setState(() {
    obscureText = obscure;
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.hintText,
      controller: widget.controller,
      obscureText: obscureText,
      labelText: widget.labelText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => validatorOfPassword(context, value),
      onChanged: (value) {
        validPassword = validatorOfPasswordBool(value);
        setState(() {});
      },
      prefixIcon: Icon(
        LucideIcons.lockKeyhole,
        color: validPassword ? AppColors.blue : AppColors.black2,
      ),
      suffixIcon: IconButton(
        onPressed: () => setObscure(!obscureText),
        icon: obscureText
            ? Icon(
                Icons.visibility_off_sharp,
                color: validPassword ? AppColors.blue : AppColors.black2,
              )
            : Icon(
                Icons.visibility,
                color: validPassword ? AppColors.blue : AppColors.black2,
              ),
      ),
    );
  }
}
