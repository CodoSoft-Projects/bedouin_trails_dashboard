import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.text,
  });
  final bool isSelected;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      color: AppColors.white,
      borderColor: isSelected ? AppColors.sandyBrown : Colors.transparent,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        title: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular20(context),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
