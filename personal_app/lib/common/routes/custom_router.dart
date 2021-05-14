// Screens
import '../../screens/error/error_screen.dart';
import '../../screens/error/not_found_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/login/login_screen.dart';
// Packages
import 'package:flutter/material.dart';
// Routes
import './route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginRoute:
        return MaterialPageRoute(builder: (_) => Login());

      case RouteNames.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case RouteNames.errorPage:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }

    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
