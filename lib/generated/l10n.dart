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

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
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

  /// `{count, plural, =0{No bookings} =1{1 booking} other{{count} bookings}}`
  String bookings(int count) {
    return Intl.plural(
      count,
      zero: 'No bookings',
      one: '1 booking',
      other: '$count bookings',
      name: 'bookings',
      desc: 'Number of bookings',
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

  /// `No Advertisements Yet`
  String get no_ads_title {
    return Intl.message(
      'No Advertisements Yet',
      name: 'no_ads_title',
      desc: '',
      args: [],
    );
  }

  /// `You haven't created any advertisements. Start promoting your offers, discounts, or important announcements to reach your customers.`
  String get no_ads_description {
    return Intl.message(
      'You haven\'t created any advertisements. Start promoting your offers, discounts, or important announcements to reach your customers.',
      name: 'no_ads_description',
      desc: '',
      args: [],
    );
  }

  /// `Advertisements help increase engagement and sales.`
  String get no_ads_hint {
    return Intl.message(
      'Advertisements help increase engagement and sales.',
      name: 'no_ads_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Advertisement`
  String get add_ad_btn {
    return Intl.message(
      'Create Advertisement',
      name: 'add_ad_btn',
      desc: '',
      args: [],
    );
  }

  /// `Pending Bookings`
  String get order_pending {
    return Intl.message(
      'Pending Bookings',
      name: 'order_pending',
      desc: '',
      args: [],
    );
  }

  /// `Completed Bookings`
  String get order_accepted {
    return Intl.message(
      'Completed Bookings',
      name: 'order_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Paid Bookings`
  String get order_payed {
    return Intl.message(
      'Paid Bookings',
      name: 'order_payed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled Bookings`
  String get order_cancelled {
    return Intl.message(
      'Cancelled Bookings',
      name: 'order_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `No Trips Yet`
  String get no_trips_title {
    return Intl.message(
      'No Trips Yet',
      name: 'no_trips_title',
      desc: '',
      args: [],
    );
  }

  /// `No trips have been added yet.\nOnce the first trip is created, it will appear here and users will be able to book it from the app.`
  String get no_trips_description {
    return Intl.message(
      'No trips have been added yet.\nOnce the first trip is created, it will appear here and users will be able to book it from the app.',
      name: 'no_trips_description',
      desc: '',
      args: [],
    );
  }

  /// `Welcome... Ready for the adventure?`
  String get login_title {
    return Intl.message(
      'Welcome... Ready for the adventure?',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to explore safari trips, book your adventure, and manage your reservations easily.`
  String get login_subtitle {
    return Intl.message(
      'Sign in to explore safari trips, book your adventure, and manage your reservations easily.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.`
  String get login_note {
    return Intl.message(
      'Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.',
      name: 'login_note',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get password_confirmation {
    return Intl.message(
      'Confirm Password',
      name: 'password_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Do you want to logout from the dashboard?`
  String get logout_confirmation {
    return Intl.message(
      'Do you want to logout from the dashboard?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Reset Password`
  String get forget_password_title {
    return Intl.message(
      'Reset Password',
      name: 'forget_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the required information to reset your password.`
  String get forget_password_subtitle {
    return Intl.message(
      'Enter the required information to reset your password.',
      name: 'forget_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.`
  String get forget_password_note {
    return Intl.message(
      'Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.',
      name: 'forget_password_note',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Verify Your Email`
  String get verify_email_title {
    return Intl.message(
      'Verify Your Email',
      name: 'verify_email_title',
      desc: '',
      args: [],
    );
  }

  /// `A verification code has been sent to your email. Please enter it below to verify your email address.`
  String get verify_email_subtitle {
    return Intl.message(
      'A verification code has been sent to your email. Please enter it below to verify your email address.',
      name: 'verify_email_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.`
  String get verify_email_note {
    return Intl.message(
      'Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.',
      name: 'verify_email_note',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message('Resend Code', name: 'resend_code', desc: '', args: []);
  }

  /// `The code has been sent to your email.`
  String get code_sent {
    return Intl.message(
      'The code has been sent to your email.',
      name: 'code_sent',
      desc: '',
      args: [],
    );
  }

  /// `The code has been verified successfully.`
  String get code_verified {
    return Intl.message(
      'The code has been verified successfully.',
      name: 'code_verified',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_title {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password.`
  String get reset_password_subtitle {
    return Intl.message(
      'Enter your new password.',
      name: 'reset_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.`
  String get reset_password_note {
    return Intl.message(
      'Log in to manage and operate the Safari Trips platform in Siwa Oasis efficiently and professionally.',
      name: 'reset_password_note',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Your password has been reset successfully. You can now log in using your new password.`
  String get password_reset_success {
    return Intl.message(
      'Your password has been reset successfully. You can now log in using your new password.',
      name: 'password_reset_success',
      desc: '',
      args: [],
    );
  }

  /// `Failed to reset the password. Please try again.`
  String get password_reset_failed {
    return Intl.message(
      'Failed to reset the password. Please try again.',
      name: 'password_reset_failed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code. Please try again.`
  String get invalid_code {
    return Intl.message(
      'Invalid verification code. Please try again.',
      name: 'invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `Email not found. Please check the email address and try again.`
  String get email_not_found {
    return Intl.message(
      'Email not found. Please check the email address and try again.',
      name: 'email_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please wait a moment before trying again.`
  String get too_many_requests {
    return Intl.message(
      'Too many requests. Please wait a moment before trying again.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address`
  String get validation_email_required {
    return Intl.message(
      'Please enter your email address',
      name: 'validation_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get validation_email_invalid {
    return Intl.message(
      'Please enter a valid email address',
      name: 'validation_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get validation_password_required {
    return Intl.message(
      'Please enter your password',
      name: 'validation_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get validation_password_length {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'validation_password_length',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters`
  String get validation_username_length {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'validation_username_length',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get validation_username_invalid {
    return Intl.message(
      'Please enter a valid name',
      name: 'validation_username_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get validation_phone_required {
    return Intl.message(
      'Please enter your phone number',
      name: 'validation_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid Egyptian phone number`
  String get validation_phone_invalid {
    return Intl.message(
      'Please enter a valid Egyptian phone number',
      name: 'validation_phone_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the trip price`
  String get validation_price_required {
    return Intl.message(
      'Please enter the trip price',
      name: 'validation_price_required',
      desc: '',
      args: [],
    );
  }

  /// `Trip price must be less than 999,999$`
  String get validation_price_max {
    return Intl.message(
      'Trip price must be less than 999,999\$',
      name: 'validation_price_max',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get validation_required {
    return Intl.message(
      'This field is required',
      name: 'validation_required',
      desc: '',
      args: [],
    );
  }

  /// `Control Panel`
  String get controlPanel {
    return Intl.message(
      'Control Panel',
      name: 'controlPanel',
      desc: '',
      args: [],
    );
  }

  /// `Trips`
  String get trips {
    return Intl.message('Trips', name: 'trips', desc: '', args: []);
  }

  /// `Suspended Trips`
  String get suspendedTrips {
    return Intl.message(
      'Suspended Trips',
      name: 'suspendedTrips',
      desc: '',
      args: [],
    );
  }

  /// `Users Management`
  String get usersManagement {
    return Intl.message(
      'Users Management',
      name: 'usersManagement',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message('Employees', name: 'employees', desc: '', args: []);
  }

  /// `Booking Requests`
  String get bookingRequests {
    return Intl.message(
      'Booking Requests',
      name: 'bookingRequests',
      desc: '',
      args: [],
    );
  }

  /// `Site Management`
  String get siteManagement {
    return Intl.message(
      'Site Management',
      name: 'siteManagement',
      desc: '',
      args: [],
    );
  }

  /// `Today's New Bookings`
  String get todayNewBookings {
    return Intl.message(
      'Today\'s New Bookings',
      name: 'todayNewBookings',
      desc: '',
      args: [],
    );
  }

  /// `Number of Users`
  String get numberOfUsers {
    return Intl.message(
      'Number of Users',
      name: 'numberOfUsers',
      desc: '',
      args: [],
    );
  }

  /// `Number of Articles`
  String get numberOfArticles {
    return Intl.message(
      'Number of Articles',
      name: 'numberOfArticles',
      desc: '',
      args: [],
    );
  }

  /// `Rating Rate`
  String get ratingRate {
    return Intl.message('Rating Rate', name: 'ratingRate', desc: '', args: []);
  }

  /// `Cancellation Rate`
  String get cancellationRate {
    return Intl.message(
      'Cancellation Rate',
      name: 'cancellationRate',
      desc: '',
      args: [],
    );
  }

  /// `New Users Growth Rate`
  String get newUsersGrowthRate {
    return Intl.message(
      'New Users Growth Rate',
      name: 'newUsersGrowthRate',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message('Booking', name: 'booking', desc: '', args: []);
  }

  /// `Active Employee`
  String get activeEmployee {
    return Intl.message(
      'Active Employee',
      name: 'activeEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Suspended Employee`
  String get inactiveEmployee {
    return Intl.message(
      'Suspended Employee',
      name: 'inactiveEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Active Trips`
  String get activeTrips {
    return Intl.message(
      'Active Trips',
      name: 'activeTrips',
      desc: '',
      args: [],
    );
  }

  /// `Trip Duration (Days)`
  String get tripDuration {
    return Intl.message(
      'Trip Duration (Days)',
      name: 'tripDuration',
      desc: '',
      args: [],
    );
  }

  /// `Search for a trip`
  String get searchTrip {
    return Intl.message(
      'Search for a trip',
      name: 'searchTrip',
      desc: '',
      args: [],
    );
  }

  /// `Add New Trip`
  String get addNewTrip {
    return Intl.message('Add New Trip', name: 'addNewTrip', desc: '', args: []);
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trip Details`
  String get tripDetails {
    return Intl.message(
      'Trip Details',
      name: 'tripDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trip Images :`
  String get tripImages {
    return Intl.message(
      'Trip Images :',
      name: 'tripImages',
      desc: '',
      args: [],
    );
  }

  /// `No images added yet 📷\nAdd images to the trip to display them better to users`
  String get noImagesMessage {
    return Intl.message(
      'No images added yet 📷\nAdd images to the trip to display them better to users',
      name: 'noImagesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add images to the trip`
  String get uploadImagesHint {
    return Intl.message(
      'Add images to the trip',
      name: 'uploadImagesHint',
      desc: '',
      args: [],
    );
  }

  /// `Trip Data :`
  String get tripData {
    return Intl.message('Trip Data :', name: 'tripData', desc: '', args: []);
  }

  /// `Trip Title`
  String get tripTitle {
    return Intl.message('Trip Title', name: 'tripTitle', desc: '', args: []);
  }

  /// `Trip Price`
  String get tripPrice {
    return Intl.message('Trip Price', name: 'tripPrice', desc: '', args: []);
  }

  /// `Trip Starting Point`
  String get tripStartPoint {
    return Intl.message(
      'Trip Starting Point',
      name: 'tripStartPoint',
      desc: '',
      args: [],
    );
  }

  /// `Trip Ending Point`
  String get tripEndPoint {
    return Intl.message(
      'Trip Ending Point',
      name: 'tripEndPoint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Must add images for the trip`
  String get mustAddImages {
    return Intl.message(
      'Must add images for the trip',
      name: 'mustAddImages',
      desc: '',
      args: [],
    );
  }

  /// `Trip Program`
  String get tripProgram {
    return Intl.message(
      'Trip Program',
      name: 'tripProgram',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Edit Trip Data`
  String get editTripData {
    return Intl.message(
      'Edit Trip Data',
      name: 'editTripData',
      desc: '',
      args: [],
    );
  }

  /// `Stop Trip Program`
  String get stopTrip {
    return Intl.message(
      'Stop Trip Program',
      name: 'stopTrip',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to stop the trip program`
  String get confirmStopTrip {
    return Intl.message(
      'Do you want to stop the trip program',
      name: 'confirmStopTrip',
      desc: '',
      args: [],
    );
  }

  /// `Activate Trip Program`
  String get activateTrip {
    return Intl.message(
      'Activate Trip Program',
      name: 'activateTrip',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to activate the trip program`
  String get confirmActivateTrip {
    return Intl.message(
      'Do you want to activate the trip program',
      name: 'confirmActivateTrip',
      desc: '',
      args: [],
    );
  }

  /// `Program Cards :`
  String get programCards {
    return Intl.message(
      'Program Cards :',
      name: 'programCards',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message('Card', name: 'card', desc: '', args: []);
  }

  /// `Do you want to delete the card`
  String get confirmDeleteCard {
    return Intl.message(
      'Do you want to delete the card',
      name: 'confirmDeleteCard',
      desc: '',
      args: [],
    );
  }

  /// `Card Title :`
  String get cardTitle {
    return Intl.message('Card Title :', name: 'cardTitle', desc: '', args: []);
  }

  /// `Card Program Description :`
  String get cardDescription {
    return Intl.message(
      'Card Program Description :',
      name: 'cardDescription',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get dayNumber {
    return Intl.message('Day', name: 'dayNumber', desc: '', args: []);
  }

  /// `Trip Days :`
  String get tripDays {
    return Intl.message('Trip Days :', name: 'tripDays', desc: '', args: []);
  }

  /// `Trip :`
  String get tripLabel {
    return Intl.message('Trip :', name: 'tripLabel', desc: '', args: []);
  }

  /// `No Trip Days Added Yet`
  String get noDaysTitle {
    return Intl.message(
      'No Trip Days Added Yet',
      name: 'noDaysTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add trip days to complete the trip data`
  String get noTripDaysMessage {
    return Intl.message(
      'Add trip days to complete the trip data',
      name: 'noTripDaysMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Trip Details`
  String get updateTripDetails {
    return Intl.message(
      'Update Trip Details',
      name: 'updateTripDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get addImage {
    return Intl.message('Add Image', name: 'addImage', desc: '', args: []);
  }

  /// `Delete Day`
  String get deleteDay {
    return Intl.message('Delete Day', name: 'deleteDay', desc: '', args: []);
  }

  /// `Do you want to delete this day and all its cards from the trip ?`
  String get confirmDeleteDay {
    return Intl.message(
      'Do you want to delete this day and all its cards from the trip ?',
      name: 'confirmDeleteDay',
      desc: '',
      args: [],
    );
  }

  /// `Add Card`
  String get addCard {
    return Intl.message('Add Card', name: 'addCard', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Must add image for the card`
  String get mustAddImageCard {
    return Intl.message(
      'Must add image for the card',
      name: 'mustAddImageCard',
      desc: '',
      args: [],
    );
  }

  /// `Add Images for the Trip`
  String get addImagesTitle {
    return Intl.message(
      'Add Images for the Trip',
      name: 'addImagesTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Delete Image`
  String get deleteImage {
    return Intl.message(
      'Delete Image',
      name: 'deleteImage',
      desc: '',
      args: [],
    );
  }

  /// `Add Card Image`
  String get addCardImage {
    return Intl.message(
      'Add Card Image',
      name: 'addCardImage',
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
