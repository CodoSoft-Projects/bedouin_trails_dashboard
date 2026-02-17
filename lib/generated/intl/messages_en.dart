// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No days', one: '1 day', other: '${count} days')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No persons', one: '1 person', other: '${count} persons')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_new_article": MessageLookupByLibrary.simpleMessage("Add New Article"),
    "add_new_question": MessageLookupByLibrary.simpleMessage(
      "Add New Question",
    ),
    "days": m0,
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no_articles_hint": MessageLookupByLibrary.simpleMessage(
      "You can add articles about trips, travel tips, or special offers.",
    ),
    "no_articles_msg": MessageLookupByLibrary.simpleMessage(
      "Start by adding your first article so it appears in the dashboard and users can read it inside the application.",
    ),
    "no_articles_title": MessageLookupByLibrary.simpleMessage(
      "No Articles Yet",
    ),
    "no_pemissions_msg": MessageLookupByLibrary.simpleMessage(
      "You currently don\'t have access 👋 \nYou have logged in successfully, but no permissions have been assigned to your account yet.\nPlease contact the system administrator to activate your permissions.",
    ),
    "no_questions_hint": MessageLookupByLibrary.simpleMessage(
      "You can add questions about booking, payment methods, trip cancellation, or any common inquiry.",
    ),
    "no_questions_msg": MessageLookupByLibrary.simpleMessage(
      "Start adding frequently asked questions to help users and answer their inquiries داخل التطبيق.",
    ),
    "no_questions_title": MessageLookupByLibrary.simpleMessage("No FAQs Yet"),
    "persons": m1,
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
  };
}
