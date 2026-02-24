// تعريف نمط التحقق من البريد الإلكتروني
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
RegExp regexEmail = RegExp(pattern);

// تعريف نمط التحقق من كلمة المرور
RegExp regexPassword = RegExp(
  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
);

String? validatorOfEmail(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validation_email_required;
  } else if (!regexEmail.hasMatch(value)) {
    return S.of(context).validation_email_invalid;
  }
  return null;
}

bool validatorOfEmailBool(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  } else if (!regexEmail.hasMatch(value)) {
    return false;
  }
  return true;
}

String? validatorOfPassword(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validation_password_required;
  } else if (value.length < 8) {
    return S.of(context).validation_password_length;
  } else {
    // if (!regexPassword.hasMatch(value)) {
    //   return 'يجب أن تحتوي كلمة المرور على حرف كبير وصغير ورقم ورمز خاص';
    // } else {
    return null;
    // }
  }
}

bool validatorOfPasswordBool(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  } else if (value.length < 8) {
    return false;
  } else {
    // if (!regexPassword.hasMatch(value)) {
    //   return false;
    // } else {
    return true;
    // }
  }
}

String? validatorOfUserName(BuildContext context, String? value) {
  if (value == null || value.trim().length < 3) {
    return S.of(context).validation_username_length;
  }

  bool upper = value.contains(RegExp(r'[A-Z]'));
  bool lower = value.contains(RegExp(r'[a-z]'));
  final RegExp arabicNameRegExp = RegExp(r'^[\u0621-\u064A\s]+$');
  if ((upper && lower) || arabicNameRegExp.hasMatch(value)) {
    return null;
  } else {
    return S.of(context).validation_username_invalid;
  }
}

bool validatorOfUserNameBool(String? value) {
  if (value == null || value.trim().length < 3) {
    return false;
  }

  bool upper = value.contains(RegExp(r'[A-Z]'));
  bool lower = value.contains(RegExp(r'[a-z]'));
  final RegExp arabicNameRegExp = RegExp(r'^[\u0621-\u064A\s]+$');
  if ((upper && lower) || arabicNameRegExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}

final RegExp regexPhone = RegExp(r'^0(10|11|12|15)\d{8}$');
String? validatorOfEgyptianPhone(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validation_phone_required;
  } else if (!regexPhone.hasMatch(value)) {
    return S.of(context).validation_phone_invalid;
  }
  return null;
}

bool validatorOfEgyptianPhoneBool(String? value) {
  if (value == null || value.isEmpty) return false;
  final isValid = regexPhone.hasMatch(value.trim());
  return isValid;
}

String? priceValidation(BuildContext context, String? value) {
  var price = double.tryParse(value ?? '0') ?? 0;
  if (value == null || value.isEmpty) {
    return S.of(context).validation_price_required;
  }
  if (price > 999999) {
    return S.of(context).validation_price_max;
  }
  return null;
}

String? simpleValidation(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return S.of(context).validation_required;
  }
  return null;
}
