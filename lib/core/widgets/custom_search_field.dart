import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    this.hintText = 'البحث',
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late final TextEditingController _controller;
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    _listener = () {
      if (mounted) setState(() {}); // avoid setState after dispose
    };

    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener); // IMPORTANT

    if (widget.controller == null) {
      _controller.dispose(); // only dispose if we created it
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      cursorColor: AppColors.black,
      style: AppTextStyles.medium20(context).copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.medium14(
          context,
        ).copyWith(color: AppColors.black2),
        prefixIcon: Icon(Icons.search, color: AppColors.black2),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, color: AppColors.black2),
                onPressed: () {
                  _controller.clear();
                  widget.onChanged?.call('');
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        filled: true,
        fillColor: AppColors.whiteGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
