import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class LabeledCheckbox extends StatefulWidget {
  final String labelText;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget? label;

  const LabeledCheckbox({
    super.key,
    this.labelText = '',
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
        isChecked = !isChecked;
        setState(() {});
      }, // toggle when tapping anywhere
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isChecked,
            activeColor: AppColors.sandyBrown,
            onChanged: (value) {
              widget.onChanged(value!);
              isChecked = value;
              setState(() {});
            },
          ),
          widget.label ??
              Text(widget.labelText, style: AppTextStyles.medium16(context)),
        ],
      ),
    );
  }
}
