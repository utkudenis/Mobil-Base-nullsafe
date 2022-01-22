// Packages
import 'package:flutter/material.dart';
// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:personal_app/redux/app_state.dart';
import 'package:personal_app/redux/user/user.action.dart';

import '../environment/environment.dart';
import '../services/navigation_service.dart';
// Helpers
import 'SharedPreferences/shared_preferences_helper.dart';
import 'application_file_system_helper.dart';
import 'auth_helper.dart';

class AppStateHelper {
  // this static values are ateended on start the app
  static late BuildContext appContext;
  static late NavigationService navigationService;
  static bool isApplicationAcitve = true;
  static bool isCameraOrGalleryActive = false;

  static Environment get environment {
    return Environment.getEnvironment();
  }

  static Future<void> clearAllDataOfApplication(BuildContext context) async {
    // Delete app directories.
    await ApplicationFileSystemHelper.deleteTemporaryDirectory();
    await ApplicationFileSystemHelper.applicationSupportDirectory();

    // Clear all shared preference datas.
    await SharedPreferencesHelper.clearAll();

    // Set initial state datas.
    await StoreProvider.of<AppState>(context).dispatch(UserLogoutAction());

    /// Makes api call to delete all data about user (notification, cookies, etc.).
    await AuthHelper.deleteDeviceFromServer();
  }
}
