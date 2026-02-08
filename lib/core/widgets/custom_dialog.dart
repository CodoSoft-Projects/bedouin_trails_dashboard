import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title = '',
    required this.content,
    this.maxWidth = 700,
    this.centerTitle = true,
  });

  final String title;
  final Widget content;
  final double maxWidth;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
          const Spacer(flex: 4),
          Text(title, style: AppTextStyles.medium24(context)),
          if (centerTitle) const Spacer(flex: 5),
        ],
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      constraints: BoxConstraints(maxWidth: maxWidth),
      alignment: Alignment.center,
      content: SingleChildScrollView(child: content),
    );
  }
}
