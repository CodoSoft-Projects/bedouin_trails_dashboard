import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ShowAdsFormSection extends StatelessWidget {
  const ShowAdsFormSection({super.key, this.canEdit = false});
  final bool canEdit;
  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'بيانات الإعلانات :',
                style: AppTextStyles.regular24(
                  context,
                ).copyWith(fontFamily: Constants.vexaFontFamily),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _AdsInfoForm(canEdit),
        ],
      ),
    );
  }
}

class _AdsInfoForm extends StatelessWidget {
  const _AdsInfoForm(this.canEdit);
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: AbsorbPointer(
        absorbing: !canEdit,
        child: Form(
          child: Column(
            spacing: 12,
            children: [
              CustomTextFormField(
                labelText: 'عنوان الإعلان',
                controller: TextEditingController(
                  text: 'عيش تجربة السفاري الحقيقية',
                ),
              ),

              CustomTextFormField(
                labelText: 'وصف الإعلان',
                lines: 7,
                controller: TextEditingController(
                  text:
                      'انطلق في رحلة استثنائية داخل قلب الصحراء، حيث الكثبان الذهبية، والواحات الخلابة، وتجربة سفاري تجمع بين المغامرة والهدوء في واحة سيوة. اصنع ذكريات لا تُنسى واكتشف جمال الطبيعة كما لم تره من قبل',
                ),
              ),

              const SizedBox(height: 24),
              if (canEdit)
                CustomButton(
                  text: 'حفظ التعديلات',
                  color: AppColors.sandyBrown,
                  horizontalPadding: 42,
                  onPressed: () {},
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
