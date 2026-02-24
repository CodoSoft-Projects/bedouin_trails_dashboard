// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new, strict_top_level_inference
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
    "accountData": MessageLookupByLibrary.simpleMessage("بيانات الحساب"),
    "activateTrip": MessageLookupByLibrary.simpleMessage("تفعيل برنامج الرحلة"),
    "activeAccounts": MessageLookupByLibrary.simpleMessage("الحسابات المفعلة"),
    "activeEmployee": MessageLookupByLibrary.simpleMessage("موظف نشط"),
    "activeTrips": MessageLookupByLibrary.simpleMessage("الرحلات النشطة"),
    "ad": MessageLookupByLibrary.simpleMessage("إعلان"),
    "adContent": MessageLookupByLibrary.simpleMessage("محتوي الإعلان"),
    "adTitle": MessageLookupByLibrary.simpleMessage("عنوان الإعلان"),
    "addCard": MessageLookupByLibrary.simpleMessage("إضافة بطاقة"),
    "addCardImage": MessageLookupByLibrary.simpleMessage(
      "قم بإضافة صورة البطاقة",
    ),
    "addImage": MessageLookupByLibrary.simpleMessage("إضافة صورة"),
    "addImagesTitle": MessageLookupByLibrary.simpleMessage("إضافة صور للرحلة"),
    "addNewAdvertisement": MessageLookupByLibrary.simpleMessage(
      "إضافة إعلان جديد",
    ),
    "addNewArticle": MessageLookupByLibrary.simpleMessage("إضافة مقالة جديدة"),
    "addNewEmployee": MessageLookupByLibrary.simpleMessage("اضافة موظف جديد"),
    "addNewItem": MessageLookupByLibrary.simpleMessage("إضافة عنصر جديد"),
    "addNewTrip": MessageLookupByLibrary.simpleMessage("اضافة رحلة جديدة"),
    "add_about_btn": MessageLookupByLibrary.simpleMessage(
      "إضافة معلومات الشركة",
    ),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("إنشاء إعلان"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("إضافة مقال جديد"),
    "add_new_question": MessageLookupByLibrary.simpleMessage("إضافة سؤال جديد"),
    "advertisementContent": MessageLookupByLibrary.simpleMessage(
      "محتوي الإعلان",
    ),
    "advertisementDisplayData": MessageLookupByLibrary.simpleMessage(
      "بيانات عرض الإعلان :",
    ),
    "advertisementImage": MessageLookupByLibrary.simpleMessage("صورة الإعلان"),
    "advertisementTitle": MessageLookupByLibrary.simpleMessage("عنوان الإعلان"),
    "advertisements": MessageLookupByLibrary.simpleMessage(" الإعلانات"),
    "answer": MessageLookupByLibrary.simpleMessage("الإجابة"),
    "article": MessageLookupByLibrary.simpleMessage("مقالة"),
    "articleContent": MessageLookupByLibrary.simpleMessage("محتوي المقالة"),
    "articleDisplayData": MessageLookupByLibrary.simpleMessage(
      "بيانات عرض المقال :",
    ),
    "articleImage": MessageLookupByLibrary.simpleMessage("صورة المقالة"),
    "articleSection": MessageLookupByLibrary.simpleMessage("فقرة المقالات"),
    "articleTitle": MessageLookupByLibrary.simpleMessage("عنوان المقالة"),
    "articleTitleShort": MessageLookupByLibrary.simpleMessage("عنوان المقال"),
    "articlesSection": MessageLookupByLibrary.simpleMessage("فقرة المقالات"),
    "blockEmployee": MessageLookupByLibrary.simpleMessage("حظر الموظف"),
    "booking": MessageLookupByLibrary.simpleMessage("حجز"),
    "bookingDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الحجز"),
    "bookingRequests": MessageLookupByLibrary.simpleMessage(
      "طلبات حجز الرحلات",
    ),
    "bookings": m0,
    "cancellationRate": MessageLookupByLibrary.simpleMessage(
      "معدل إلغاء الحجوزات",
    ),
    "card": MessageLookupByLibrary.simpleMessage("البطاقة"),
    "cardDescription": MessageLookupByLibrary.simpleMessage(
      "وصف برنامج البطاقة :",
    ),
    "cardTitle": MessageLookupByLibrary.simpleMessage("عنوان البطاقة :"),
    "changePassword": MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
    "change_language": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
    "code_sent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال الرمز إلى بريدك الإلكتروني.",
    ),
    "code_verified": MessageLookupByLibrary.simpleMessage(
      "تم التحقق من الرمز بنجاح.",
    ),
    "completePayment": MessageLookupByLibrary.simpleMessage("إتمام دفع الحجز"),
    "confirmActivateTrip": MessageLookupByLibrary.simpleMessage(
      "هل تريد تفعيل برنامج الرحلة",
    ),
    "confirmBlockEmployee": MessageLookupByLibrary.simpleMessage(
      "هل انت متاكد من حظر الموظف ؟",
    ),
    "confirmDeleteAd": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا الإعلان؟",
    ),
    "confirmDeleteAdvertisement": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا الإعلان؟",
    ),
    "confirmDeleteArticle": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا المقال؟",
    ),
    "confirmDeleteCard": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف البطاقة",
    ),
    "confirmDeleteDay": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا يوم وجميع بطاقاته من الرحلة ؟",
    ),
    "confirmDeleteElement": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا العنصر؟",
    ),
    "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا العنصر؟",
    ),
    "confirmDeleteQuestion": MessageLookupByLibrary.simpleMessage(
      "هل تريد حذف هذا السؤال؟",
    ),
    "confirmPayment": MessageLookupByLibrary.simpleMessage("تأكيد إتمام الدفع"),
    "confirmPaymentMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من إتمام دفع الحجز؟",
    ),
    "confirmReject": MessageLookupByLibrary.simpleMessage("تأكيد رفض الحجز"),
    "confirmRejectMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد من رفض طلب الحجز؟",
    ),
    "confirmStopTrip": MessageLookupByLibrary.simpleMessage(
      "هل تريد ايقاف برنامج الرحلة",
    ),
    "confirmUnblockEmployee": MessageLookupByLibrary.simpleMessage(
      "هل انت متاكد من الغاء حظر الموظف ؟",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("تاكيد"),
    "controlPanel": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الحالية",
    ),
    "dayNumber": MessageLookupByLibrary.simpleMessage("اليوم"),
    "days": m1,
    "deleteAd": MessageLookupByLibrary.simpleMessage("حذف الإعلان"),
    "deleteArticle": MessageLookupByLibrary.simpleMessage("حذف المقالة"),
    "deleteDay": MessageLookupByLibrary.simpleMessage("حذف اليوم"),
    "deleteElement": MessageLookupByLibrary.simpleMessage("حذف العنصر"),
    "deleteImage": MessageLookupByLibrary.simpleMessage("حذف الصورة"),
    "deleteQuestion": MessageLookupByLibrary.simpleMessage("حذف السؤال"),
    "departureDate": MessageLookupByLibrary.simpleMessage("تاريخ المغادرة"),
    "description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "displayData": MessageLookupByLibrary.simpleMessage("بيانات عرض"),
    "displayedElements": MessageLookupByLibrary.simpleMessage(
      "العناصر المعروضة",
    ),
    "displayedItems": MessageLookupByLibrary.simpleMessage("العناصر المعروضة"),
    "editAboutItem": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات العنصر",
    ),
    "editAccountData": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات الحساب",
    ),
    "editAd": MessageLookupByLibrary.simpleMessage("تعديل بيانات الإعلان"),
    "editAdvertisementData": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات الإعلان",
    ),
    "editArticle": MessageLookupByLibrary.simpleMessage("تعديل بيانات المقالة"),
    "editArticleData": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات المقالة",
    ),
    "editEmployeeData": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات الموظف",
    ),
    "editItemData": MessageLookupByLibrary.simpleMessage("تعديل بيانات العنصر"),
    "editQuestion": MessageLookupByLibrary.simpleMessage("تعديل بيانات السؤال"),
    "editQuestionData": MessageLookupByLibrary.simpleMessage(
      "تعديل بيانات السؤال",
    ),
    "editTripData": MessageLookupByLibrary.simpleMessage("تعديل بيانات الرحلة"),
    "element": MessageLookupByLibrary.simpleMessage("عنصر"),
    "elementContent": MessageLookupByLibrary.simpleMessage("محتوي العنصر"),
    "elementDisplayData": MessageLookupByLibrary.simpleMessage(
      "بيانات عرض العنصر :",
    ),
    "elementTitle": MessageLookupByLibrary.simpleMessage("عنوان العنصر"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير موجود. الرجاء التحقق من البريد الإلكتروني وإعادة المحاولة.",
    ),
    "employeeData": MessageLookupByLibrary.simpleMessage("بيانات الموظف"),
    "employees": MessageLookupByLibrary.simpleMessage("الموظفين"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "faqSection": MessageLookupByLibrary.simpleMessage("فقرة الأسئلة الشائعة"),
    "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
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
    "image": MessageLookupByLibrary.simpleMessage("صورة"),
    "imageRequired": MessageLookupByLibrary.simpleMessage("الصورة مطلوبة"),
    "inactiveAccounts": MessageLookupByLibrary.simpleMessage(
      "الحسابات المعطلة",
    ),
    "inactiveEmployee": MessageLookupByLibrary.simpleMessage("موظف موقوف"),
    "inquiry": MessageLookupByLibrary.simpleMessage("الاستفسار (الملاحظات)"),
    "invalid_code": MessageLookupByLibrary.simpleMessage(
      "رمز التحقق غير صالح. الرجاء المحاولة مرة أخرى.",
    ),
    "itemContent": MessageLookupByLibrary.simpleMessage("محتوي العنصر"),
    "itemDisplayData": MessageLookupByLibrary.simpleMessage(
      "بيانات عرض العنصر :",
    ),
    "itemImage": MessageLookupByLibrary.simpleMessage("صورة العنصر"),
    "itemTitle": MessageLookupByLibrary.simpleMessage("عنوان العنصر"),
    "jobRole": MessageLookupByLibrary.simpleMessage("Job Role"),
    "lastName": MessageLookupByLibrary.simpleMessage("الاسم الثاني"),
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
    "manageAboutUs": MessageLookupByLibrary.simpleMessage("إدارة صفحة من نحن"),
    "manageAboutUsPage": MessageLookupByLibrary.simpleMessage(
      "إدارة صفحة من نحن",
    ),
    "manageAds": MessageLookupByLibrary.simpleMessage("إدارة الاعلانات"),
    "manageArticles": MessageLookupByLibrary.simpleMessage("إدارة المقالات"),
    "manageBookingRequests": MessageLookupByLibrary.simpleMessage(
      "ادارة طلبات الحجز",
    ),
    "manageFAQ": MessageLookupByLibrary.simpleMessage("إدارة الأسئلة الشائعة"),
    "manageSiteAdvertisement": MessageLookupByLibrary.simpleMessage(
      "إدارة إعلان الموقع",
    ),
    "manageSuspendedTrips": MessageLookupByLibrary.simpleMessage(
      "ادارة الرحلات الموقوفة",
    ),
    "manageTrips": MessageLookupByLibrary.simpleMessage(
      "ادارة الرحلات السياحية",
    ),
    "manageUsers": MessageLookupByLibrary.simpleMessage("ادارة المستخدمين"),
    "manageWebsite": MessageLookupByLibrary.simpleMessage("ادارة الموقع"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("رقم الجوال"),
    "mustAddImageCard": MessageLookupByLibrary.simpleMessage(
      "يجب اضافة صورة للبطاقة",
    ),
    "mustAddImages": MessageLookupByLibrary.simpleMessage(
      "يجب إضافة صور للرحلة",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
    "newUsersGrowthRate": MessageLookupByLibrary.simpleMessage(
      "معدل زيادة المستخدمين الجدد",
    ),
    "next": MessageLookupByLibrary.simpleMessage("التالي"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "noDaysTitle": MessageLookupByLibrary.simpleMessage(
      "لم يتم إضافة أيام الرحلة بعد",
    ),
    "noEmployees": MessageLookupByLibrary.simpleMessage("لا يوجد موظفين"),
    "noImagesMessage": MessageLookupByLibrary.simpleMessage(
      "لا توجد صور مضافة حاليّا 💷\nقم بإضافة صور للرحلة لعرضها للمستخدمين بشكل أفضل",
    ),
    "noTripDaysMessage": MessageLookupByLibrary.simpleMessage(
      "قم بإضافة أيام الرحلة لإكمال بيانات الرحلة",
    ),
    "noUsers": MessageLookupByLibrary.simpleMessage("لا يوجد مستخدمين"),
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
    "numberOfAdults": MessageLookupByLibrary.simpleMessage("عدد البالغين"),
    "numberOfArticles": MessageLookupByLibrary.simpleMessage(
      "عدد المقالات في الموقع",
    ),
    "numberOfChildren": MessageLookupByLibrary.simpleMessage("عدد الأطفال"),
    "numberOfUsers": MessageLookupByLibrary.simpleMessage("عدد المستخدمين"),
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
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
    "passwordsMismatch": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور الجديدة غير متطابقة",
    ),
    "perPersonPrice": MessageLookupByLibrary.simpleMessage("سعر الفرد"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "pleaseSelectImage": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار صورة",
    ),
    "previous": MessageLookupByLibrary.simpleMessage("السابق"),
    "profileData": MessageLookupByLibrary.simpleMessage("بيانات الملف الشخصي"),
    "programCards": MessageLookupByLibrary.simpleMessage("بطاقات البرنامج :"),
    "question": MessageLookupByLibrary.simpleMessage("السؤال"),
    "questionDisplayData": MessageLookupByLibrary.simpleMessage(
      "بيانات عرض السؤال :",
    ),
    "ratingRate": MessageLookupByLibrary.simpleMessage("معدل التقييمات"),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "rejectBooking": MessageLookupByLibrary.simpleMessage("رفض طلب الحجز"),
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
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("حفظ التعديلات"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "searchTrip": MessageLookupByLibrary.simpleMessage("ابحث عن رحلة"),
    "selectImage": MessageLookupByLibrary.simpleMessage("يرجى اختيار صورة"),
    "select_language": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
    "send": MessageLookupByLibrary.simpleMessage("إرسال"),
    "siteAdvertisement": MessageLookupByLibrary.simpleMessage("الإعلانات"),
    "siteManagement": MessageLookupByLibrary.simpleMessage("إدارة الموقع"),
    "stopTrip": MessageLookupByLibrary.simpleMessage("إيقاف برنامج الرحلة"),
    "suspendedTrips": MessageLookupByLibrary.simpleMessage("الرحلات الموقوفة"),
    "title": MessageLookupByLibrary.simpleMessage("العنوان"),
    "todayNewBookings": MessageLookupByLibrary.simpleMessage(
      "حجوزات جديدة لليوم",
    ),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "تم إرسال العديد من الطلبات. الرجاء الانتظار قليلاً قبل المحاولة مرة أخرى.",
    ),
    "totalPrice": MessageLookupByLibrary.simpleMessage("السعر الإجمالي"),
    "tripData": MessageLookupByLibrary.simpleMessage("بيانات الرحلة :"),
    "tripDays": MessageLookupByLibrary.simpleMessage("أيام الرحلة :"),
    "tripDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الرحلة"),
    "tripDuration": MessageLookupByLibrary.simpleMessage("مدة الرحلة (يوم)"),
    "tripEndPoint": MessageLookupByLibrary.simpleMessage("نقطة نهاية الرحلة"),
    "tripImages": MessageLookupByLibrary.simpleMessage("صور الرحلة :"),
    "tripLabel": MessageLookupByLibrary.simpleMessage("رحلة :"),
    "tripPrice": MessageLookupByLibrary.simpleMessage("سعر الرحلة"),
    "tripProgram": MessageLookupByLibrary.simpleMessage("برنامج الرحلة"),
    "tripRegistrationDate": MessageLookupByLibrary.simpleMessage(
      "تاريخ تسجيل الرحلة",
    ),
    "tripStartPoint": MessageLookupByLibrary.simpleMessage("نقطة بداية الرحلة"),
    "tripTitle": MessageLookupByLibrary.simpleMessage("عنوان الرحلة"),
    "trips": MessageLookupByLibrary.simpleMessage("الرحلات السياحية"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
    "unblockEmployee": MessageLookupByLibrary.simpleMessage("الغاء حظر الموظف"),
    "updateTripDetails": MessageLookupByLibrary.simpleMessage(
      "تعديل تفاصيل الرحلة",
    ),
    "uploadImagesHint": MessageLookupByLibrary.simpleMessage(
      "قم بإضافة صور للرحلة",
    ),
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
