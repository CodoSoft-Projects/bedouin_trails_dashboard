// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/ads_provider.dart';
import 'add_ads_item_dialog.dart';

class NoAdsSection extends StatelessWidget {
  const NoAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    var prov = context.read<AdsProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ===== Illustration =====
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.sandyBrown.withOpacity(.08),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.campaign_outlined,
                      size: 90,
                      color: AppColors.sandyBrown,
                    ),

                    /// floating add icon
                    Positioned(
                      bottom: 18,
                      right: 18,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.sandyBrown,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.sandyBrown.withOpacity(.35),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ===== Title =====
              Text(
                s.no_ads_title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              /// ===== Description =====
              Text(
                s.no_ads_description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              /// ===== Hint =====
              Text(
                s.no_ads_hint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              /// ===== Create Ad Button =====
              SizedBox(
                width: 250,
                height: 48,
                child: CustomButton(
                  onPressed: () {
                    prov.clearControllers();
                    addAdsItemDialog(context);
                  },
                  icon: const Icon(Icons.add),
                  text: s.add_ad_btn,
                  color: AppColors.sandyBrown,
                ),
              ),

              const SizedBox(height: 14),

              /// ===== Refresh =====
              TextButton.icon(
                onPressed: () {
                  prov.getAllAds();
                },
                icon: const Icon(Icons.refresh),
                label: Text(s.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
