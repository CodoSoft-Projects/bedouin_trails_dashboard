import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, this.isSelected = false});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      color: AppColors.white,
      borderColor: isSelected ? AppColors.sandyBrown : Colors.transparent,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        title: Text(
          'ما الذي يشمله سعر الرحلة ؟',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular20(context),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
