import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/articles_provider.dart';
import 'add_article_dialog.dart';

class NoArticlesScreen extends StatelessWidget {
  const NoArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ===== Illustration Shape =====
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppColors.sandyBrown.withOpacity(.07),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: 95,
                      color: AppColors.sandyBrown.withOpacity(.9),
                    ),

                    /// small floating add icon
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
                              // ignore: deprecated_member_use
                              color: AppColors.sandyBrown.withOpacity(.4),
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

              const SizedBox(height: 34),

              /// ===== Title =====
              Text(
                'لا توجد مقالات بعد',
                style: AppTextStyles.semiBold40(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              /// ===== Message =====
              Text(
                'ابدأ بإضافة أول مقال ليظهر في لوحة التحكم ويمكن للمستخدمين قراءته في التطبيق.',
                style: AppTextStyles.regular16(
                  context,
                ).copyWith(color: Colors.grey.shade600, height: 1.6),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 14),

              /// ===== Hint =====
              Text(
                'يمكنك إضافة مقالات عن الرحلات، النصائح السياحية، أو العروض الخاصة.',
                style: AppTextStyles.regular20(
                  context,
                ).copyWith(color: Colors.grey.shade500),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 36),

              /// ===== CTA Button =====
              SizedBox(
                width: 260,
                child: CustomButton(
                  text: 'إضافة مقال جديد',
                  color: AppColors.sandyBrown,
                  onPressed: () {
                    addArticleDialog(context);
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// ===== Optional refresh =====
              TextButton.icon(
                onPressed: () {
                  context.read<ArticlesProvider>().getAllArticles();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('تحديث'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
