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
      "${Intl.plural(count, zero: 'لا توجد حجوزات', one: 'حجز واحد', two: 'حجزان', few: '${count} حجوزات', many: '${count} حجزًا', other: '${count} حجز')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'لا توجد أيام', one: 'يوم واحد', two: 'يومان', few: '${count} أيام', many: '${count} يومًا', other: '${count} يوم')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activeEmployee": MessageLookupByLibrary.simpleMessage("موظف نشط"),
    "activeTrips": MessageLookupByLibrary.simpleMessage("الرحلات النشطة"),
    "addNewTrip": MessageLookupByLibrary.simpleMessage("اضافة رحلة جديدة"),
    "add_about_btn": MessageLookupByLibrary.simpleMessage(
      "إضافة معلومات الشركة",
    ),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("إنشاء إعلان"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("إضافة مقال جديد"),
    "add_new_question": MessageLookupByLibrary.simpleMessage("إضافة سؤال جديد"),
    "booking": MessageLookupByLibrary.simpleMessage("حجز"),
    "bookingRequests": MessageLookupByLibrary.simpleMessage(
      "طلبات حجز الرحلات",
    ),
    "bookings": m0,
    "cancellationRate": MessageLookupByLibrary.simpleMessage(
      "معدل إلغاء الحجوزات",
    ),
    "change_language": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "code_sent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال الرمز إلى بريدك الإلكتروني.",
    ),
    "code_verified": MessageLookupByLibrary.simpleMessage(
      "تم التحقق من الرمز بنجاح.",
    ),
    "controlPanel": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "days": m1,
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير موجود. الرجاء التحقق من البريد الإلكتروني وإعادة المحاولة.",
    ),
    "employees": MessageLookupByLibrary.simpleMessage("الموظفين"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "forget_password_note": MessageLookupByLibrary.simpleMessage(
      "سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية",
    ),
    "forget_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "أدخل البيانات المطلوبة لإعادة تعيين كلمة المرور",
    ),
    "forget_password_title": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "forgot_password": MessageLookupByLibrary.simpleMessage(
      "نسيت كلمة المرور؟",
    ),
    "inactiveEmployee": MessageLookupByLibrary.simpleMessage("موظف موقوف"),
    "invalid_code": MessageLookupByLibrary.simpleMessage(
      "رمز التحقق غير صالح. الرجاء المحاولة مرة أخرى.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_note": MessageLookupByLibrary.simpleMessage(
      "سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية",
    ),
    "login_subtitle": MessageLookupByLibrary.simpleMessage(
      "سجّل دخولك علشان تستعرض رحلات السفاري، تحجز مغامرتك، وتدير حجوزاتك بكل سهولة.,",
    ),
    "login_title": MessageLookupByLibrary.simpleMessage(
      "أهلا بك .. جاهز للمغامرة",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "هل ترغب في تسجيل الخروج من لوحة التحكم؟",
    ),
    "newUsersGrowthRate": MessageLookupByLibrary.simpleMessage(
      "معدل زيادة المستخدمين الجدد",
    ),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
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
    "no_trips_description": MessageLookupByLibrary.simpleMessage(
      "لم يتم إضافة أي رحلة بعد.\nبمجرد إنشاء أول رحلة ستظهر هنا ويمكن للمستخدمين حجزها من التطبيق.",
    ),
    "no_trips_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد رحلات حالياً",
    ),
    "numberOfArticles": MessageLookupByLibrary.simpleMessage(
      "عدد المقالات في الموقع",
    ),
    "numberOfUsers": MessageLookupByLibrary.simpleMessage("عدد المستخدمين"),
    "order_accepted": MessageLookupByLibrary.simpleMessage("حجوزات مكتملة"),
    "order_cancelled": MessageLookupByLibrary.simpleMessage("حجوزات ملغاة"),
    "order_payed": MessageLookupByLibrary.simpleMessage("حجوزات مدفوعة"),
    "order_pending": MessageLookupByLibrary.simpleMessage("حجوزات معلقة"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "password_confirmation": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "password_reset_failed": MessageLookupByLibrary.simpleMessage(
      "فشل في إعادة تعيين كلمة المرور. الرجاء المحاولة مرة أخرى.",
    ),
    "password_reset_success": MessageLookupByLibrary.simpleMessage(
      "تم إعادة تعيين كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.",
    ),
    "previous": MessageLookupByLibrary.simpleMessage("السابق"),
    "ratingRate": MessageLookupByLibrary.simpleMessage("معدل التقييمات"),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "resend_code": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
    "reset_password_note": MessageLookupByLibrary.simpleMessage(
      "سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية",
    ),
    "reset_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "ادخل كلمة المرور الجديدة",
    ),
    "reset_password_title": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "searchTrip": MessageLookupByLibrary.simpleMessage("ابحث عن رحلة"),
    "select_language": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
    "send": MessageLookupByLibrary.simpleMessage("إرسال"),
    "siteManagement": MessageLookupByLibrary.simpleMessage("إدارة الموقع"),
    "suspendedTrips": MessageLookupByLibrary.simpleMessage("الرحلات الموقوفة"),
    "todayNewBookings": MessageLookupByLibrary.simpleMessage(
      "حجوزات جديدة لليوم",
    ),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "تم إرسال العديد من الطلبات. الرجاء الانتظار قليلاً قبل المحاولة مرة أخرى.",
    ),
    "tripDuration": MessageLookupByLibrary.simpleMessage("مدة الرحلة (يوم)"),
    "trips": MessageLookupByLibrary.simpleMessage("الرحلات السياحية"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "usersManagement": MessageLookupByLibrary.simpleMessage(
      "متابعة المستخدمين",
    ),
    "validation_email_invalid": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريد إلكتروني صالح",
    ),
    "validation_email_required": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل البريد الإلكتروني",
    ),
    "validation_password_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
    ),
    "validation_password_required": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل كلمة المرور",
    ),
    "validation_phone_invalid": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتف مصري صحيح",
    ),
    "validation_phone_required": MessageLookupByLibrary.simpleMessage(
      "من فضلك أدخل رقم الهاتف",
    ),
    "validation_price_max": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون سعر الرحلة أقل من  \$999999",
    ),
    "validation_price_required": MessageLookupByLibrary.simpleMessage(
      "الرجاء إدخال سعر الرحلة",
    ),
    "validation_required": MessageLookupByLibrary.simpleMessage(
      "هذا الحقل مطلوب",
    ),
    "validation_username_invalid": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال اسم صحيح",
    ),
    "validation_username_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون الاسم 3 أحرف على الأقل",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("تحقق"),
    "verify_email_note": MessageLookupByLibrary.simpleMessage(
      "سجّل حسابك لإدارة وتشغيل منصة رحلات السفاري في واحة سيوة بكفاءة واحترافية",
    ),
    "verify_email_subtitle": MessageLookupByLibrary.simpleMessage(
      "تم إرسال رمز التحقق إلى بريدك الإلكتروني. الرجاء إدخاله أدناه للتحقق من بريدك الإلكتروني.",
    ),
    "verify_email_title": MessageLookupByLibrary.simpleMessage(
      "تحقق من بريدك الإلكتروني",
    ),
    "viewDetails": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
  };
}
