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
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
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
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
