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
      "${Intl.plural(count, zero: 'No bookings', one: '1 booking', other: '${count} bookings')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No days', one: '1 day', other: '${count} days')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "activeEmployee": MessageLookupByLibrary.simpleMessage("Active Employee"),
    "activeTrips": MessageLookupByLibrary.simpleMessage("Active Trips"),
    "addNewTrip": MessageLookupByLibrary.simpleMessage("Add New Trip"),
    "add_about_btn": MessageLookupByLibrary.simpleMessage("Add About Us"),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("Create Advertisement"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("Add New Article"),
    "add_new_question": MessageLookupByLibrary.simpleMessage(
      "Add New Question",
    ),
    "booking": MessageLookupByLibrary.simpleMessage("Booking"),
    "bookingRequests": MessageLookupByLibrary.simpleMessage("Booking Requests"),
    "bookings": m0,
    "cancellationRate": MessageLookupByLibrary.simpleMessage(
      "Cancellation Rate",
    ),
    "change_language": MessageLookupByLibrary.simpleMessage("Change Language"),
    "code_sent": MessageLookupByLibrary.simpleMessage(
      "The code has been sent to your email.",
    ),
    "code_verified": MessageLookupByLibrary.simpleMessage(
      "The code has been verified successfully.",
    ),
    "controlPanel": MessageLookupByLibrary.simpleMessage("Control Panel"),
    "days": m1,
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "Email not found. Please check the email address and try again.",
    ),
    "employees": MessageLookupByLibrary.simpleMessage("Employees"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "forget_password_note": MessageLookupByLibrary.simpleMessage(
      "Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.",
    ),
    "forget_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Enter the required information to reset your password.",
    ),
    "forget_password_title": MessageLookupByLibrary.simpleMessage(
      "Reset Password",
    ),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "inactiveEmployee": MessageLookupByLibrary.simpleMessage(
      "Suspended Employee",
    ),
    "invalid_code": MessageLookupByLibrary.simpleMessage(
      "Invalid verification code. Please try again.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_note": MessageLookupByLibrary.simpleMessage(
      "Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.",
    ),
    "login_subtitle": MessageLookupByLibrary.simpleMessage(
      "Sign in to explore safari trips, book your adventure, and manage your reservations easily.",
    ),
    "login_title": MessageLookupByLibrary.simpleMessage(
      "Welcome... Ready for the adventure?",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "Do you want to logout from the dashboard?",
    ),
    "newUsersGrowthRate": MessageLookupByLibrary.simpleMessage(
      "New Users Growth Rate",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
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
      "No trips have been added yet.\nOnce the first trip is created, it will appear here and users will be able to book it from the app.",
    ),
    "no_trips_title": MessageLookupByLibrary.simpleMessage("No Trips Yet"),
    "numberOfArticles": MessageLookupByLibrary.simpleMessage(
      "Number of Articles",
    ),
    "numberOfUsers": MessageLookupByLibrary.simpleMessage("Number of Users"),
    "order_accepted": MessageLookupByLibrary.simpleMessage(
      "Completed Bookings",
    ),
    "order_cancelled": MessageLookupByLibrary.simpleMessage(
      "Cancelled Bookings",
    ),
    "order_payed": MessageLookupByLibrary.simpleMessage("Paid Bookings"),
    "order_pending": MessageLookupByLibrary.simpleMessage("Pending Bookings"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_confirmation": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "password_reset_failed": MessageLookupByLibrary.simpleMessage(
      "Failed to reset the password. Please try again.",
    ),
    "password_reset_success": MessageLookupByLibrary.simpleMessage(
      "Your password has been reset successfully. You can now log in using your new password.",
    ),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "ratingRate": MessageLookupByLibrary.simpleMessage("Rating Rate"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "resend_code": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "reset_password_note": MessageLookupByLibrary.simpleMessage(
      "Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.",
    ),
    "reset_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your new password.",
    ),
    "reset_password_title": MessageLookupByLibrary.simpleMessage(
      "Reset Password",
    ),
    "searchTrip": MessageLookupByLibrary.simpleMessage("Search for a trip"),
    "select_language": MessageLookupByLibrary.simpleMessage("Select Language"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "siteManagement": MessageLookupByLibrary.simpleMessage("Site Management"),
    "suspendedTrips": MessageLookupByLibrary.simpleMessage("Suspended Trips"),
    "todayNewBookings": MessageLookupByLibrary.simpleMessage(
      "Today\'s New Bookings",
    ),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please wait a moment before trying again.",
    ),
    "tripDuration": MessageLookupByLibrary.simpleMessage(
      "Trip Duration (Days)",
    ),
    "trips": MessageLookupByLibrary.simpleMessage("Trips"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "usersManagement": MessageLookupByLibrary.simpleMessage("Users Management"),
    "validation_email_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "validation_email_required": MessageLookupByLibrary.simpleMessage(
      "Please enter your email address",
    ),
    "validation_password_length": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "validation_password_required": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "validation_phone_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid Egyptian phone number",
    ),
    "validation_phone_required": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number",
    ),
    "validation_price_max": MessageLookupByLibrary.simpleMessage(
      "Trip price must be less than 999,999\$",
    ),
    "validation_price_required": MessageLookupByLibrary.simpleMessage(
      "Please enter the trip price",
    ),
    "validation_required": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "validation_username_invalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid name",
    ),
    "validation_username_length": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 3 characters",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "verify_email_note": MessageLookupByLibrary.simpleMessage(
      "Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.",
    ),
    "verify_email_subtitle": MessageLookupByLibrary.simpleMessage(
      "A verification code has been sent to your email. Please enter it below to verify your email address.",
    ),
    "verify_email_title": MessageLookupByLibrary.simpleMessage(
      "Verify Your Email",
    ),
    "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
  };
}
