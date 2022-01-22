import 'package:flutter/material.dart';
import './exports/models.dart';
//import './exports/helpers.dart';

@immutable
class AppState {
  // Common
  final AuthModel auth;

  AppState({
    // Common
    required this.auth,
  });

  factory AppState.initial() {
    var appState = AppState(
      // Common
      auth: AuthModel(userId: "null", cookie: "null"),
    );

    return appState;
  }
}
