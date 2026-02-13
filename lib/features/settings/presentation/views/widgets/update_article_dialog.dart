import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_circular_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

Future<dynamic> updateArticleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        maxWidth: 600,
        title: 'تعديل بيانات المقالة',
        content: _Form(),
      );
    },
  );
}

class _Form extends StatelessWidget {
  const _Form();

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

    return Column(
      spacing: 16,
      children: [
        const SizedBox(width: 600),
        AspectRatio(
          aspectRatio: 584 / 264,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(Assets.imagesTestTripImage),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    CustomCircularButton(
                      icon: LucideIcons.upload,
                      size: 18,
                      borderSide: BorderSide.none,
                      backgroundColor: AppColors.whiteGrey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        CustomTextFormField(
          labelText: 'عنوان المقالة',
          hintText: 'عنوان المقالة',
          controller: TextEditingController(text: 'مغامرة بين الرمال والنجوم'),
        ),

        CustomTextFormField(
          labelText: 'محتوي المقالة',
          hintText: 'محتوي المقالة',
          lines: (article.text.length / 40).ceil(),
          controller: article,
        ),

        const SizedBox(height: 16),

        CustomButton(
          text: 'حفظ التعديلات',
          color: AppColors.sandyBrown,
          horizontalPadding: 72,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
