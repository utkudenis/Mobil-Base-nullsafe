import 'package:device_info/device_info.dart';
import 'dart:io';

import 'log_helper.dart';


class AuthHelper{


  /// Makes api call to delete all data about user (notification, cookies, etc.).
  static Future<void> deleteDeviceFromServer() async {
    try {
      final String deviceId = await getDeviceId();

      if (deviceId.isEmpty) return;
      // this place for delete device from Notification pool by sending request
      //await NotificationHubApi().apiV1NotificationHubDeleteDevice(deviceId);
      //await NotificationDeviceRegisterationService().deregisterNotificationHub();
    } catch (e) {
      LogHelper.logException('apm_logout_approve_action_sheet.dart', 'deleteDevice', e);
    }
  }

  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }




}