// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'لا توجد أيام', one: 'يوم واحد', two: 'يومان', few: '${count} أيام', many: '${count} يومًا', other: '${count} يوم')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'لا يوجد أشخاص', one: 'شخص واحد', two: 'شخصان', few: '${count} أشخاص', many: '${count} شخصًا', other: '${count} شخص')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_about_btn": MessageLookupByLibrary.simpleMessage(
      "إضافة معلومات الشركة",
    ),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("إنشاء إعلان"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("إضافة مقال جديد"),
    "add_new_question": MessageLookupByLibrary.simpleMessage("إضافة سؤال جديد"),
    "days": m0,
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no_about_description": MessageLookupByLibrary.simpleMessage(
      "لم تقم بإضافة معلومات شركتك بعد.\nأضف قسم من نحن حتى يتمكن العملاء والموظفون من التعرف على نشاطك التجاري.",
    ),
    "no_about_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد معلومات عن الشركة",
    ),
    "no_ads_description": MessageLookupByLibrary.simpleMessage(
      "لم تقم بإنشاء أي إعلان حتى الآن. ابدأ بعرض العروض أو الخصومات أو التنبيهات المهمة للوصول إلى عملائك.",
    ),
    "no_ads_hint": MessageLookupByLibrary.simpleMessage(
      "الإعلانات تساعد على زيادة التفاعل والمبيعات.",
    ),
    "no_ads_title": MessageLookupByLibrary.simpleMessage("لا توجد إعلانات بعد"),
    "no_articles_hint": MessageLookupByLibrary.simpleMessage(
      "يمكنك إضافة مقالات عن الرحلات، النصائح السياحية، أو العروض الخاصة.",
    ),
    "no_articles_msg": MessageLookupByLibrary.simpleMessage(
      "ابدأ بإضافة أول مقال ليظهر في لوحة التحكم ويمكن للمستخدمين قراءته داخل التطبيق.",
    ),
    "no_articles_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد مقالات بعد",
    ),
    "no_pemissions_msg": MessageLookupByLibrary.simpleMessage(
      "لا تملك صلاحيات حالياً 👋 \nتم تسجيل دخولك بنجاح، لكن لم يتم منحك أي صلاحيات لاستخدام لوحة التحكم بعد. \nيرجى التواصل مع مسؤول النظام لتفعيل الصلاحيات الخاصة بك.",
    ),
    "no_questions_hint": MessageLookupByLibrary.simpleMessage(
      "يمكنك إضافة أسئلة حول الحجز، طرق الدفع، إلغاء الرحلات أو أي استفسار متكرر.",
    ),
    "no_questions_msg": MessageLookupByLibrary.simpleMessage(
      "ابدأ بإضافة الأسئلة الشائعة لمساعدة المستخدمين والإجابة على استفساراتهم داخل التطبيق.",
    ),
    "no_questions_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد أسئلة شائعة بعد",
    ),
    "order_accepted": MessageLookupByLibrary.simpleMessage("حجوزات مكتملة"),
    "order_cancelled": MessageLookupByLibrary.simpleMessage("حجوزات ملغاة"),
    "order_payed": MessageLookupByLibrary.simpleMessage("حجوزات مدفوعة"),
    "order_pending": MessageLookupByLibrary.simpleMessage("حجوزات معلقة"),
    "persons": m1,
    "previous": MessageLookupByLibrary.simpleMessage("السابق"),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
  };
}
