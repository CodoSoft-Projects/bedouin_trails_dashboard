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
    "accountData": MessageLookupByLibrary.simpleMessage("Account Data"),
    "activateTrip": MessageLookupByLibrary.simpleMessage(
      "Activate Trip Program",
    ),
    "activeAccounts": MessageLookupByLibrary.simpleMessage("Active Accounts"),
    "activeEmployee": MessageLookupByLibrary.simpleMessage("Active Employee"),
    "activeTrips": MessageLookupByLibrary.simpleMessage("Active Trips"),
    "ad": MessageLookupByLibrary.simpleMessage("Advertisement"),
    "adContent": MessageLookupByLibrary.simpleMessage("Advertisement Content"),
    "adTitle": MessageLookupByLibrary.simpleMessage("Advertisement Title"),
    "addCard": MessageLookupByLibrary.simpleMessage("Add Card"),
    "addCardImage": MessageLookupByLibrary.simpleMessage("Add Card Image"),
    "addImage": MessageLookupByLibrary.simpleMessage("Add Image"),
    "addImagesTitle": MessageLookupByLibrary.simpleMessage(
      "Add Images for the Trip",
    ),
    "addNewEmployee": MessageLookupByLibrary.simpleMessage("Add New Employee"),
    "addNewTrip": MessageLookupByLibrary.simpleMessage("Add New Trip"),
    "add_about_btn": MessageLookupByLibrary.simpleMessage("Add About Us"),
    "add_ad_btn": MessageLookupByLibrary.simpleMessage("Create Advertisement"),
    "add_new_article": MessageLookupByLibrary.simpleMessage("Add New Article"),
    "add_new_question": MessageLookupByLibrary.simpleMessage(
      "Add New Question",
    ),
    "answer": MessageLookupByLibrary.simpleMessage("Answer"),
    "article": MessageLookupByLibrary.simpleMessage("Article"),
    "articleContent": MessageLookupByLibrary.simpleMessage("Article Content"),
    "articleTitle": MessageLookupByLibrary.simpleMessage("Article Title"),
    "articlesSection": MessageLookupByLibrary.simpleMessage("Articles Section"),
    "booking": MessageLookupByLibrary.simpleMessage("Booking"),
    "bookingDetails": MessageLookupByLibrary.simpleMessage("Booking Details"),
    "bookingRequests": MessageLookupByLibrary.simpleMessage("Booking Requests"),
    "bookings": m0,
    "cancellationRate": MessageLookupByLibrary.simpleMessage(
      "Cancellation Rate",
    ),
    "card": MessageLookupByLibrary.simpleMessage("Card"),
    "cardDescription": MessageLookupByLibrary.simpleMessage(
      "Card Program Description :",
    ),
    "cardTitle": MessageLookupByLibrary.simpleMessage("Card Title :"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "change_language": MessageLookupByLibrary.simpleMessage("Change Language"),
    "code_sent": MessageLookupByLibrary.simpleMessage(
      "The code has been sent to your email.",
    ),
    "code_verified": MessageLookupByLibrary.simpleMessage(
      "The code has been verified successfully.",
    ),
    "completePayment": MessageLookupByLibrary.simpleMessage("Complete Payment"),
    "confirmActivateTrip": MessageLookupByLibrary.simpleMessage(
      "Do you want to activate the trip program",
    ),
    "confirmDeleteAd": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this advertisement?",
    ),
    "confirmDeleteArticle": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this article?",
    ),
    "confirmDeleteCard": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete the card",
    ),
    "confirmDeleteDay": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this day and all its cards from the trip ?",
    ),
    "confirmDeleteElement": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this element?",
    ),
    "confirmDeleteQuestion": MessageLookupByLibrary.simpleMessage(
      "Do you want to delete this question?",
    ),
    "confirmPayment": MessageLookupByLibrary.simpleMessage(
      "Confirm Payment Completion",
    ),
    "confirmPaymentMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure about completing the payment?",
    ),
    "confirmReject": MessageLookupByLibrary.simpleMessage("Confirm Rejection"),
    "confirmRejectMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure about rejecting the booking?",
    ),
    "confirmStopTrip": MessageLookupByLibrary.simpleMessage(
      "Do you want to stop the trip program",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Confirmation"),
    "controlPanel": MessageLookupByLibrary.simpleMessage("Control Panel"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current Password"),
    "dayNumber": MessageLookupByLibrary.simpleMessage("Day"),
    "days": m1,
    "deleteAd": MessageLookupByLibrary.simpleMessage("Delete Advertisement"),
    "deleteArticle": MessageLookupByLibrary.simpleMessage("Delete Article"),
    "deleteDay": MessageLookupByLibrary.simpleMessage("Delete Day"),
    "deleteElement": MessageLookupByLibrary.simpleMessage("Delete Element"),
    "deleteImage": MessageLookupByLibrary.simpleMessage("Delete Image"),
    "deleteQuestion": MessageLookupByLibrary.simpleMessage("Delete Question"),
    "departureDate": MessageLookupByLibrary.simpleMessage("Departure Date"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "displayData": MessageLookupByLibrary.simpleMessage("Display Data"),
    "displayedElements": MessageLookupByLibrary.simpleMessage(
      "Displayed Elements",
    ),
    "editAboutItem": MessageLookupByLibrary.simpleMessage("Edit Element Data"),
    "editAccountData": MessageLookupByLibrary.simpleMessage(
      "Edit Account Data",
    ),
    "editAd": MessageLookupByLibrary.simpleMessage("Edit Advertisement Data"),
    "editArticle": MessageLookupByLibrary.simpleMessage("Edit Article Data"),
    "editEmployeeData": MessageLookupByLibrary.simpleMessage(
      "Edit Employee Data",
    ),
    "editQuestion": MessageLookupByLibrary.simpleMessage("Edit Question Data"),
    "editTripData": MessageLookupByLibrary.simpleMessage("Edit Trip Data"),
    "element": MessageLookupByLibrary.simpleMessage("Element"),
    "elementContent": MessageLookupByLibrary.simpleMessage("Element Content"),
    "elementDisplayData": MessageLookupByLibrary.simpleMessage(
      "Element Display Data:",
    ),
    "elementTitle": MessageLookupByLibrary.simpleMessage("Element Title"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "Email not found. Please check the email address and try again.",
    ),
    "employeeData": MessageLookupByLibrary.simpleMessage("Employee Data"),
    "employees": MessageLookupByLibrary.simpleMessage("Employees"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "faqSection": MessageLookupByLibrary.simpleMessage(
      "Frequently Asked Questions Section",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
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
    "image": MessageLookupByLibrary.simpleMessage("Image"),
    "inactiveAccounts": MessageLookupByLibrary.simpleMessage(
      "Inactive Accounts",
    ),
    "inactiveEmployee": MessageLookupByLibrary.simpleMessage(
      "Suspended Employee",
    ),
    "inquiry": MessageLookupByLibrary.simpleMessage("Inquiry (Notes)"),
    "invalid_code": MessageLookupByLibrary.simpleMessage(
      "Invalid verification code. Please try again.",
    ),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
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
    "manageAboutUs": MessageLookupByLibrary.simpleMessage(
      "Manage About Us Page",
    ),
    "manageAds": MessageLookupByLibrary.simpleMessage("Manage Advertisements"),
    "manageArticles": MessageLookupByLibrary.simpleMessage("Manage Articles"),
    "manageBookingRequests": MessageLookupByLibrary.simpleMessage(
      "Manage Booking Requests",
    ),
    "manageFAQ": MessageLookupByLibrary.simpleMessage(
      "Manage Frequently Asked Questions",
    ),
    "manageSiteAdvertisement": MessageLookupByLibrary.simpleMessage(
      "Manage Site Advertisement",
    ),
    "manageSuspendedTrips": MessageLookupByLibrary.simpleMessage(
      "Manage Suspended Trips",
    ),
    "manageTrips": MessageLookupByLibrary.simpleMessage("Manage Trips"),
    "manageUsers": MessageLookupByLibrary.simpleMessage("Manage Users"),
    "manageWebsite": MessageLookupByLibrary.simpleMessage("Manage Website"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
    "mustAddImageCard": MessageLookupByLibrary.simpleMessage(
      "Must add image for the card",
    ),
    "mustAddImages": MessageLookupByLibrary.simpleMessage(
      "Must add images for the trip",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newUsersGrowthRate": MessageLookupByLibrary.simpleMessage(
      "New Users Growth Rate",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noDaysTitle": MessageLookupByLibrary.simpleMessage(
      "No Trip Days Added Yet",
    ),
    "noEmployees": MessageLookupByLibrary.simpleMessage("No Employees"),
    "noImagesMessage": MessageLookupByLibrary.simpleMessage(
      "No images added yet 📷\nAdd images to the trip to display them better to users",
    ),
    "noTripDaysMessage": MessageLookupByLibrary.simpleMessage(
      "Add trip days to complete the trip data",
    ),
    "noUsers": MessageLookupByLibrary.simpleMessage("No Users"),
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
    "numberOfAdults": MessageLookupByLibrary.simpleMessage("Number of Adults"),
    "numberOfArticles": MessageLookupByLibrary.simpleMessage(
      "Number of Articles",
    ),
    "numberOfChildren": MessageLookupByLibrary.simpleMessage(
      "Number of Children",
    ),
    "numberOfUsers": MessageLookupByLibrary.simpleMessage("Number of Users"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
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
    "passwordsMismatch": MessageLookupByLibrary.simpleMessage(
      "New passwords do not match",
    ),
    "perPersonPrice": MessageLookupByLibrary.simpleMessage("Per Person Price"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "profileData": MessageLookupByLibrary.simpleMessage("Profile Data"),
    "programCards": MessageLookupByLibrary.simpleMessage("Program Cards :"),
    "question": MessageLookupByLibrary.simpleMessage("Question"),
    "ratingRate": MessageLookupByLibrary.simpleMessage("Rating Rate"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "rejectBooking": MessageLookupByLibrary.simpleMessage(
      "Reject Booking Request",
    ),
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
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchTrip": MessageLookupByLibrary.simpleMessage("Search for a trip"),
    "selectImage": MessageLookupByLibrary.simpleMessage(
      "Please select an image",
    ),
    "select_language": MessageLookupByLibrary.simpleMessage("Select Language"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "siteAdvertisement": MessageLookupByLibrary.simpleMessage("Advertisements"),
    "siteManagement": MessageLookupByLibrary.simpleMessage("Site Management"),
    "stopTrip": MessageLookupByLibrary.simpleMessage("Stop Trip Program"),
    "suspendedTrips": MessageLookupByLibrary.simpleMessage("Suspended Trips"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "todayNewBookings": MessageLookupByLibrary.simpleMessage(
      "Today\'s New Bookings",
    ),
    "too_many_requests": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please wait a moment before trying again.",
    ),
    "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
    "tripData": MessageLookupByLibrary.simpleMessage("Trip Data :"),
    "tripDays": MessageLookupByLibrary.simpleMessage("Trip Days :"),
    "tripDetails": MessageLookupByLibrary.simpleMessage("Trip Details"),
    "tripDuration": MessageLookupByLibrary.simpleMessage(
      "Trip Duration (Days)",
    ),
    "tripEndPoint": MessageLookupByLibrary.simpleMessage("Trip Ending Point"),
    "tripImages": MessageLookupByLibrary.simpleMessage("Trip Images :"),
    "tripLabel": MessageLookupByLibrary.simpleMessage("Trip :"),
    "tripPrice": MessageLookupByLibrary.simpleMessage("Trip Price"),
    "tripProgram": MessageLookupByLibrary.simpleMessage("Trip Program"),
    "tripRegistrationDate": MessageLookupByLibrary.simpleMessage(
      "Trip Registration Date",
    ),
    "tripStartPoint": MessageLookupByLibrary.simpleMessage(
      "Trip Starting Point",
    ),
    "tripTitle": MessageLookupByLibrary.simpleMessage("Trip Title"),
    "trips": MessageLookupByLibrary.simpleMessage("Trips"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "updateTripDetails": MessageLookupByLibrary.simpleMessage(
      "Update Trip Details",
    ),
    "uploadImagesHint": MessageLookupByLibrary.simpleMessage(
      "Add images to the trip",
    ),
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
