// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

abstract class AppMessage {
  /// ================= SUCCESS =================
  static void successBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showBar(
      context,
      message: message,
      backgroundColor: const Color(0xFF2EBD85).withOpacity(.40),
      textColor: const Color.fromARGB(255, 0, 100, 62),
      icon: Icons.check_circle_rounded,
      duration: duration,
    );
  }

  /// ================= ERROR =================
  static void errorBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showBar(
      context,
      message: message,
      backgroundColor: const Color(0xFFE53935).withOpacity(.40),
      textColor: const Color(0xFF8B1E1E),
      icon: Icons.error_rounded,
      duration: duration,
    );
  }

  /// ================= CORE =================
  static void _showBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
    required Duration duration,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    /// THIS is the safe way
    messenger
      ..hideCurrentSnackBar()
      ..clearSnackBars();

    final snackBar = SnackBar(
      duration: duration,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      content: _SnackBarContent(
        message: message,
        backgroundColor: backgroundColor,
        textColor: textColor,
        icon: icon,
        onClose: () => messenger.hideCurrentSnackBar(),
      ),
    );

    messenger.showSnackBar(snackBar);
  }
}

class _SnackBarContent extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final VoidCallback onClose;

  const _SnackBarContent({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: textColor.withOpacity(.35)),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 22),
          const SizedBox(width: 10),

          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bold18(context).copyWith(color: textColor),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(width: 6),

          InkWell(
            onTap: onClose,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.close_rounded, color: textColor, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
