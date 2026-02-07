import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText = '',
    this.labelText = '',
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.color = AppColors.whiteGrey,
    this.colorText = AppColors.black2,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.lines = 1,
    this.readOnly = false,
    this.enabled = true,
    this.radius = 16,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.showBorder = false,
    this.borderColor = AppColors.borderGrey,
  });

  final String hintText;
  final String labelText;
  final double radius;
  final int lines;
  final Color color, colorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText, readOnly, enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.medium20(context).copyWith(
        height: 0,
        color: AppColors.black,
        // fontFamily: Constants.vexaFontFamily,
      ),
      enabled: enabled,
      maxLines: lines,
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        label: labelText.isEmpty
            ? null
            : Text(
                labelText,
                style: AppTextStyles.medium16(
                  context,
                ).copyWith(color: AppColors.blue),
              ),
        hint: hintText.isEmpty
            ? null
            : Text(
                hintText,
                style: AppTextStyles.regular20(
                  context,
                ).copyWith(color: colorText),
              ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: showBorder ? BorderSide(color: borderColor) : BorderSide.none,
    );
  }
}
