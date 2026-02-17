// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/articles_provider.dart';
import 'add_article_dialog.dart';

class NoArticlesSection extends StatelessWidget {
  const NoArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var prov = context.read<ArticlesProvider>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _ArticleIllustration(),

              const SizedBox(height: 34),

              /// Title
              Text(
                s.no_articles_title,
                style: AppTextStyles.semiBold40(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              /// Message
              Text(
                s.no_articles_msg,
                style: AppTextStyles.regular16(
                  context,
                ).copyWith(color: Colors.grey.shade600, height: 1.6),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 14),

              /// Hint
              Text(
                s.no_articles_hint,
                style: AppTextStyles.regular20(
                  context,
                ).copyWith(color: Colors.grey.shade500),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36),

              /// Add Button
              SizedBox(
                width: 260,
                child: CustomButton(
                  text: s.add_new_article,
                  color: AppColors.sandyBrown,
                  onPressed: () {
                    prov.clearControllers();
                    addArticleDialog(context);
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// Refresh
              TextButton.icon(
                onPressed: () {
                  prov.getAllArticles();
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

/// ================= Illustration Widget =================

class _ArticleIllustration extends StatelessWidget {
  const _ArticleIllustration();

  @override
  Widget build(BuildContext context) {
    final color = AppColors.sandyBrown;

    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: color.withOpacity(.07),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.article_outlined, size: 95, color: color.withOpacity(.9)),

          Positioned(
            bottom: 18,
            right: 18,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.add, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
