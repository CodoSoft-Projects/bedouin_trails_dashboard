import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/constants.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _currentLocale;

  LanguageProvider() {
    _loadLanguage();
  }

  Locale get currentLocale => _currentLocale ?? const Locale('ar');

  Future<void> _loadLanguage() async {
    final box = Hive.box(Constants.language);
    final langCode = box.get('langCode', defaultValue: 'ar');
    _currentLocale = Locale(langCode);
    notifyListeners();
  }

  Future<void> _changeLanguage(String langCode) async {
    final box = Hive.box(Constants.language);
    await box.put('langCode', langCode);
    _currentLocale = Locale(langCode);
    notifyListeners();
  }

  Future<void> toArabic() async {
    await _changeLanguage('ar');
  }

  Future<void> toEnglish() async {
    await _changeLanguage('en');
  }

  bool isAabic() {
    if (_currentLocale!.languageCode == 'ar') {
      return true;
    } else {
      return false;
    }
  }
}
