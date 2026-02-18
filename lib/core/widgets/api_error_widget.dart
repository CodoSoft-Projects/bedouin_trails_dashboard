// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../functions/check_unauthenticated.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_button.dart';

class ApiErrorView extends StatelessWidget {
  final String msg;
  final VoidCallback onRetry;

  const ApiErrorView({super.key, required this.msg, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.sandyBrown.withOpacity(0.05),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Error Icon
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.red.withOpacity(.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_sharp,
                  color: Colors.redAccent.shade700,
                  size: 46,
                ),
              ),

              const SizedBox(height: 24),

              /// Title
              Text(
                S.of(context).error,
                textAlign: TextAlign.center,
                style: AppTextStyles.semiBold20(context),
              ),

              const SizedBox(height: 10),

              /// Message
              Text(
                msg,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular16(context),
              ),

              const SizedBox(height: 28),

              /// Retry Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: S.of(context).tryAgain,
                  color: AppColors.sandyBrown,
                  onPressed: () async {
                    /// important: first handle auth
                    checkUnauthenticated(context, msg: msg);
                    onRetry();
                  },
                  icon: const Icon(Icons.refresh_rounded),
                ),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
