import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomPopupMenuButton<T> extends StatefulWidget {
  final List<T> items;
  final T initialValue;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<int> onSelected; // returns index instead of value
  final TextStyle? textStyle;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Offset offset;

  const CustomPopupMenuButton({
    super.key,
    required this.items,
    required this.initialValue,
    required this.itemLabelBuilder,
    required this.onSelected,
    this.textStyle,
    this.backgroundColor = AppColors.white,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    this.offset = const Offset(0, 42),
  });

  @override
  State<CustomPopupMenuButton<T>> createState() =>
      _CustomPopupMenuButtonState<T>();
}

class _CustomPopupMenuButtonState<T> extends State<CustomPopupMenuButton<T>> {
  late T selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      offset: widget.offset,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      onSelected: (index) {
        setState(() {
          selectedItem = widget.items[index];
        });
        widget.onSelected(index);
      },
      itemBuilder: (context) => List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        return PopupMenuItem<int>(
          value: index,
          child: Text(
            widget.itemLabelBuilder(item),
            style: widget.textStyle ?? AppTextStyles.regular16(context),
          ),
        );
      }),
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(color: AppColors.borderGrey),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.itemLabelBuilder(selectedItem),
              style: widget.textStyle ?? AppTextStyles.regular16(context),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }
}
