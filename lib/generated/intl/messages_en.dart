// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No days', one: '1 day', other: '${count} days')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No persons', one: '1 person', other: '${count} persons')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_about_btn": MessageLookupByLibrary.simpleMessage("Add About Us"),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("Create Advertisement"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("Add New Article"),
    "add_new_question": MessageLookupByLibrary.simpleMessage(
      "Add New Question",
    ),
    "days": m0,
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no_about_description": MessageLookupByLibrary.simpleMessage(
      "You haven\'t added your company information yet.\nAdd your About Us section so customers and employees can learn more about your business.",
    ),
    "no_about_title": MessageLookupByLibrary.simpleMessage(
      "No About Us Information",
    ),
    "no_ads_description": MessageLookupByLibrary.simpleMessage(
      "You haven\'t created any advertisements. Start promoting your offers, discounts, or important announcements to reach your customers.",
    ),
    "no_ads_hint": MessageLookupByLibrary.simpleMessage(
      "Advertisements help increase engagement and sales.",
    ),
    "no_ads_title": MessageLookupByLibrary.simpleMessage(
      "No Advertisements Yet",
    ),
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
    "no_trips_description": MessageLookupByLibrary.simpleMessage(
      "No trips have been added yet.\nOnce you create your first trip, it will appear here and users will be able to book it from the app.",
    ),
    "no_trips_title": MessageLookupByLibrary.simpleMessage("No Trips Yet"),
    "order_accepted": MessageLookupByLibrary.simpleMessage(
      "Completed Bookings",
    ),
    "order_cancelled": MessageLookupByLibrary.simpleMessage(
      "Cancelled Bookings",
    ),
    "order_payed": MessageLookupByLibrary.simpleMessage("Paid Bookings"),
    "order_pending": MessageLookupByLibrary.simpleMessage("Pending Bookings"),
    "persons": m1,
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
  };
}
