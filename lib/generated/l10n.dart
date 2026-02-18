// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `{count, plural, =0{No persons} =1{1 person} other{{count} persons}}`
  String persons(int count) {
    return Intl.plural(
      count,
      zero: 'No persons',
      one: '1 person',
      other: '$count persons',
      name: 'persons',
      desc: 'Number of persons',
      args: [count],
    );
  }

  /// `{count, plural, =0{No days} =1{1 day} other{{count} days}}`
  String days(int count) {
    return Intl.plural(
      count,
      zero: 'No days',
      one: '1 day',
      other: '$count days',
      name: 'days',
      desc: 'Number of days',
      args: [count],
    );
  }

  /// `You currently don't have access 👋 \nYou have logged in successfully, but no permissions have been assigned to your account yet.\nPlease contact the system administrator to activate your permissions.`
  String get no_pemissions_msg {
    return Intl.message(
      'You currently don\'t have access 👋 \nYou have logged in successfully, but no permissions have been assigned to your account yet.\nPlease contact the system administrator to activate your permissions.',
      name: 'no_pemissions_msg',
      desc: '',
      args: [],
    );
  }

  /// `No FAQs Yet`
  String get no_questions_title {
    return Intl.message(
      'No FAQs Yet',
      name: 'no_questions_title',
      desc: '',
      args: [],
    );
  }

  /// `Start adding frequently asked questions to help users and answer their inquiries داخل التطبيق.`
  String get no_questions_msg {
    return Intl.message(
      'Start adding frequently asked questions to help users and answer their inquiries داخل التطبيق.',
      name: 'no_questions_msg',
      desc: '',
      args: [],
    );
  }

  /// `You can add questions about booking, payment methods, trip cancellation, or any common inquiry.`
  String get no_questions_hint {
    return Intl.message(
      'You can add questions about booking, payment methods, trip cancellation, or any common inquiry.',
      name: 'no_questions_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add New Question`
  String get add_new_question {
    return Intl.message(
      'Add New Question',
      name: 'add_new_question',
      desc: '',
      args: [],
    );
  }

  /// `No Articles Yet`
  String get no_articles_title {
    return Intl.message(
      'No Articles Yet',
      name: 'no_articles_title',
      desc: '',
      args: [],
    );
  }

  /// `Start by adding your first article so it appears in the dashboard and users can read it inside the application.`
  String get no_articles_msg {
    return Intl.message(
      'Start by adding your first article so it appears in the dashboard and users can read it inside the application.',
      name: 'no_articles_msg',
      desc: '',
      args: [],
    );
  }

  /// `You can add articles about trips, travel tips, or special offers.`
  String get no_articles_hint {
    return Intl.message(
      'You can add articles about trips, travel tips, or special offers.',
      name: 'no_articles_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add New Article`
  String get add_new_article {
    return Intl.message(
      'Add New Article',
      name: 'add_new_article',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `No About Us Information`
  String get no_about_title {
    return Intl.message(
      'No About Us Information',
      name: 'no_about_title',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added your company information yet.\nAdd your About Us section so customers and employees can learn more about your business.`
  String get no_about_description {
    return Intl.message(
      'You haven\'t added your company information yet.\nAdd your About Us section so customers and employees can learn more about your business.',
      name: 'no_about_description',
      desc: '',
      args: [],
    );
  }

  /// `Add About Us`
  String get add_about_btn {
    return Intl.message(
      'Add About Us',
      name: 'add_about_btn',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
