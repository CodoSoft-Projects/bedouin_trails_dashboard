import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/helpers/dialog_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dotted_box.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'update_article_dialog.dart';

class ArticleFormSection extends StatelessWidget {
  const ArticleFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDottedBox(
      hPadding: 18,
      vPadding: 12,
      borderColor: AppColors.borderGrey,
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  'بيانات عرض المقال :',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular24(
                    context,
                  ).copyWith(fontFamily: Constants.vexaFontFamily),
                ),
              ),

              const Spacer(),

              CustomCircularButton(
                backgroundColor: AppColors.whiteGrey,
                icon: LucideIcons.squarePen,
                borderSide: BorderSide.none,
                size: 18,
                onPressed: () {
                  updateArticleDialog(context);
                },
              ),

              CustomCircularButton(
                backgroundColor: AppColors.whiteGrey,
                icon: LucideIcons.trash2,
                borderSide: BorderSide.none,
                size: 18,
                onPressed: () {
                  DialogHelper.showQuestionDialog(
                    context,
                    title: 'تاكيد',
                    desc: 'هل تريد حذف هذا المقال؟',
                    onCancel: () {},
                    onOk: () {
                      DialogHelper.showSuccessDialog(
                        context,
                        title: 'تم حذف المقال بنجاح',
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(child: _ArticleForm()),
        ],
      ),
    );
  }
}

class _ArticleForm extends StatelessWidget {
  const _ArticleForm();

  @override
  Widget build(BuildContext context) {
    var article = TextEditingController(
      text:
          '''تخيّل أنك بين رمال صحراء ذهبية تمتد إلى الأفق، محاط بجمال طبيعي ساحر، وتتنفس هواءً نقياً بعيداً عن ضوضاء المدينة… هذه هي تجربة السفاري في واحة سيوة. من أول لحظة تصل فيها، ستجد نفسك في عالم مختلف تماماً، حيث تمتزج الطبيعة مع التاريخ والثقافة بطريقة فريدة.
          ماذا نقدم في رحلاتنا؟
          جولات 4×4 وسط الصحراء: اكتشف الكثبان الرملية الذهبية على متن سيارات مجهزة، وتمتع بمغامرة مليئة بالإثارة.
          زيارة المعالم الطبيعية: مثل بحيرة المالح، عيون سيوة الطبيعية، وواحة الطيور حيث يمكن رؤية أنواع نادرة من الطيور والحيوانات الصحراوية.
          تجربة الثقافة المحلية: التقي بسكان سيوة المحليين، وتعلم عن عاداتهم وتقاليدهم، وزُر قرية شالي القديمة التي تحكي قصص الواحة عبر العصور.
          المبيت في الخيام البدوية: عيش تجربة التخييم الصحراوي تحت سماء مليئة بالنجوم، مع جلسات نار تقليدية وأطباق صحراوية لذيذة.
          أفضل أوقات الرحلات
          تقدم رحلاتنا خيارات متنوعة لتناسب جميع الأوقات:
          رحلة يوم كامل: مناسبة لمحبي المغامرات القصيرة.''',
    );
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: AbsorbPointer(
            child: Column(
              spacing: 12,
              children: [
                const SizedBox(height: 32),
                AspectRatio(
                  aspectRatio: 584 / 264,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(Assets.imagesTestTripImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  labelText: 'عنوان المقال',
                  controller: TextEditingController(
                    text: 'مغامرة بين الرمال والنجوم',
                  ),
                ),

                CustomTextFormField(
                  labelText: 'محتوي المقالة',
                  lines: (article.text.length / 40).ceil(),
                  controller: article,
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
