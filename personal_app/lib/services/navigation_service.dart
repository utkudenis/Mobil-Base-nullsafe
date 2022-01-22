import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> pushReplacementNamed(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil<T>(Route<T> newRoute, RoutePredicate predicate) {
    return navigatorKey.currentState!.pushAndRemoveUntil(newRoute, predicate);
  }

  Future<dynamic> push<T>(Route<T> newRoute) {
    return navigatorKey.currentState!.push(newRoute);
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }

  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }
}
