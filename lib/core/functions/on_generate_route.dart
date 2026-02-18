import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/booking_requests/presentation/views/request_details_view.dart';
import '../../features/booking_requests/presentation/views/user_request_details_view.dart';
import '../../features/dashboard/dashboard_view.dart';
import '../../features/employees/presentation/views/employee_details_view.dart';
import '../../features/employees/presentation/views/new_employee_view.dart';
import '../../features/profile/presentation/views/edit_profile_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/settings/presentation/views/about_us_view.dart';
import '../../features/settings/presentation/views/ads_view.dart';
import '../../features/settings/presentation/views/articles_view.dart';
import '../../features/settings/presentation/views/questions_view.dart';
import '../../features/trips/presentation/views/new_trip_view.dart';
import '../../features/trips/presentation/views/trip_details_view.dart';
import '../../features/trips/presentation/views/update_trip_view.dart';
import '../../features/users/presentation/views/user_details_view.dart';
import '../../features/users/presentation/views/user_trip_details_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    /// Authentication Routes
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

    /// Dashboard Routes
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());

    /// Profile Routes
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const EditProfileView());

    /// Trips Routes
    case TripDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const TripDetailsView());
    case UpdateTripView.routeName:
      return MaterialPageRoute(builder: (_) => const UpdateTripView());
    case NewTripView.routeName:
      return MaterialPageRoute(builder: (_) => const NewTripView());

    /// Employees Routs
    case EmployeeDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const EmployeeDetailsView());
    case NewEmployeeView.routeName:
      return MaterialPageRoute(builder: (_) => const NewEmployeeView());

    /// Users Routs
    case UserDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const UserDetailsView());
    case UserTripDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const UserTripDetailsView());

    /// Bookings Requests Routs
    case RequestDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const RequestDetailsView());
    case UserRequestDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const UserRequestDetailsView());

    /// Settings Routs
    case AdsView.routeName:
      return MaterialPageRoute(builder: (_) => const AdsView());
    case QuestionsView.routeName:
      return MaterialPageRoute(builder: (_) => const QuestionsView());
    case ArticlesView.routeName:
      return MaterialPageRoute(builder: (_) => const ArticlesView());
    case AboutUsView.routeName:
      return MaterialPageRoute(builder: (_) => const AboutUsView());

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
