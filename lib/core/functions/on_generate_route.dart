import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/dashboard/dashboard_view.dart';
import '../../features/employees/presentation/views/employee_details_view.dart';
import '../../features/employees/presentation/views/new_employee_view.dart';
import '../../features/trips/presentation/views/new_trip_view.dart';
import '../../features/trips/presentation/views/suspended_trip_details_view.dart';
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

    /// Trips Routes
    case TripDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const TripDetailsView());
    case UpdateTripView.routeName:
      return MaterialPageRoute(builder: (_) => const UpdateTripView());
    case NewTripView.routeName:
      return MaterialPageRoute(builder: (_) => const NewTripView());
    case SuspendedTripDetailsView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SuspendedTripDetailsView(),
      );

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

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
