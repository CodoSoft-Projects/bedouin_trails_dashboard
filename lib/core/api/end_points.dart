class EndPoints {
  static const baseUrl = 'https://api.bedouintrails.com/';

  /// Auth Endpoints
  static const register = '/api/admin/register';
  static const login = '/api/admin/login';
  static const forgetPassword = '/api/admin/forget-password';
  static const verifyOTP = '/api/admin/verify-otp';
  static const resetPassword = '/api/admin/reset-password';
  static const logout = '/api/admin/logout';
  static const profile = '/api/admin/profile';

  /// Control Panel
  static const controlPanel = '/api/admin/home';

  /// Trips
  static const trips = '/api/admin/traps';
  static const tripDay = '/api/admin/trap-days';
  static const tripDayCart = '/api/admin/trap-day-cards';

  /// Employees
  static const employees = '/api/admin/employees';

  /// Settings
  static const articles = '/api/admin/articles';
  static const questions = '/api/admin/common-questions';
  static const aboutUs = '/api/admin/about-us';
  static const ads = '/api/admin/sliders';

  /// Users
  static const users = '/api/admin/users';

  /// Orders
  static const orders = '/api/admin/orders';
}

// documentation :- https://documenter.getpostman.com/view/31698735/2sBXVmeo6H#fbcf2af5-e804-44cf-b840-035c624609e4
// base_url :- https://bedouintrails.com/api/public
// flutter build web --base-href="/dashboard/"
