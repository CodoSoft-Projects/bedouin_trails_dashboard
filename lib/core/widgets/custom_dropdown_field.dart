import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  const CustomDropdownTextField({
    super.key,
    required this.items,
    required this.itemLabel,
    this.onSelected,
    this.value,
    this.hintText,
    this.validator,
    this.controller,
    this.selectedTrailingIcon,
    this.labelText = '',
  });

  /// List of items of any type
  final List<T> items;

  /// Function to get the label for each item
  final String Function(T) itemLabel;

  final T? value;
  final String? hintText;
  final String labelText;
  final String? Function(T?)? validator;
  final ValueChanged<T?>? onSelected;
  final TextEditingController? controller;
  final Widget? selectedTrailingIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      controller: controller,
      onSelected: onSelected,
      hintText: hintText,
      label: labelText.isEmpty
          ? null
          : Text(
              labelText,
              style: AppTextStyles.medium16(
                context,
              ).copyWith(color: AppColors.blue),
            ),
      requestFocusOnTap: true,
      enableFilter: false, // no filtering
      expandedInsets: EdgeInsets.zero,
      selectedTrailingIcon: selectedTrailingIcon,
      textStyle: AppTextStyles.medium24(context),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.regular20(
          context,
        ).copyWith(color: AppColors.black2),
        fillColor: AppColors.whiteGrey,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),

      /// Show all items (max height = 5 items visible)
      menuHeight: items.length > 5 ? 5 * 60.0 : items.length * 60.0,

      dropdownMenuEntries: items
          .map(
            (item) => DropdownMenuEntry<T>(
              label: itemLabel(item),
              value: item,
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                textStyle: WidgetStatePropertyAll(
                  AppTextStyles.regular24(context),
                ),
                overlayColor: const WidgetStatePropertyAll(AppColors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
