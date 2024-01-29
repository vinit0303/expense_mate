import 'package:expense_manager/ui/auth/screens/forgot_password_screen.dart';
import 'package:expense_manager/ui/auth/screens/login_screen.dart';
import 'package:expense_manager/ui/auth/screens/signup_screen.dart';
import 'package:expense_manager/ui/auth/screens/splash_screen.dart';
import 'package:expense_manager/ui/dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';

class RouteConstants {
  static const String splashScreen = "splashScreen";
  static const String login = "routeLogin";
  static const String signup = "signup";
  static const String dashboard = "dashboard";
  static const String forgotpasswordscreen = "forgotpasswordscreen";
}

final navigationKey = GlobalKey<NavigatorState>();

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    var _ = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteConstants.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteConstants.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RouteConstants.forgotpasswordscreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case RouteConstants.dashboard:
        return MaterialPageRoute(builder: (context) => const Dashboard());
    }
    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('404!!'),
      ),
    );
  }

  static Future<T?> pushNamed<T extends Object?>(String route,
      {Map<String, dynamic>? arguments}) {
    return Navigator.of(navigationKey.currentContext!)
        .pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?>(String route,
      {Map<String, dynamic>? arguments}) {
    return Navigator.of(navigationKey.currentContext!)
        .pushReplacementNamed(route, arguments: arguments);
  }

  static void pop<T extends Object?>([T? result]) {
    return Navigator.of(navigationKey.currentContext!).pop<T>(result);
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.of(navigationKey.currentContext!)
        .pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  static void popUntil(RoutePredicate predicate) {
    return Navigator.of(navigationKey.currentContext!).popUntil(predicate);
  }
}
