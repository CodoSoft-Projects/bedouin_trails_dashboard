import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'earth_icon.dart';

class CustomAuthViewImageSection extends StatelessWidget {
  const CustomAuthViewImageSection({
    super.key,
    required this.image,
    this.showBackIcon = true,
    required this.note,
  });
  final String image;
  final bool showBackIcon;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          EarthIocon(showBackIcon: showBackIcon),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              note,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular20(
                context,
              ).copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
