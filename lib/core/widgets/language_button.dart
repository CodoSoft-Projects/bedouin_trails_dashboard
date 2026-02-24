import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../entities/language_entity.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.isSelected,
    required this.language,
    this.onTap,
  });
  final bool isSelected;
  final LanguageEntity language;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.babyBlue,
        shadowColor: AppColors.whiteGrey,
        padding: const EdgeInsets.all(24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: isSelected ? AppColors.sandyBrown : AppColors.babyBlue,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Container(
              color: Colors.white,
              height: 32,
              width: 32,
              child: SvgPicture.asset(language.flagSvg, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(language.name, style: AppTextStyles.bold22(context)),
          ),
          const SizedBox(width: 8),
          AbsorbPointer(
            child: Radio(
              value: isSelected,
              // ignore: deprecated_member_use
              groupValue: true,
              fillColor: WidgetStateProperty.all(AppColors.sandyBrown),
            ),
          ),
        ],
      ),
    );
  }
}
