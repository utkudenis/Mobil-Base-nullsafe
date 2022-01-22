// ignore_for_file: prefer_const_constructors, avoid_classes_with_only_static_members

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:personal_app/services/navigation_service.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/launcher_icon"),
        iOS: IOSInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        ));
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? pageRoute) async {
      if (pageRoute != null) {
        switch (pageRoute) {
          case 'credit-refresh':
            return NavigationService().pushNamed("home");
          case 'refresh-profile':
            return NavigationService().pushNamed("home");
          default:
            return NavigationService().pushNamed("home");
        }
      }
    });
  }

  static Future<void> display(RemoteMessage message) async {
    try {
      final int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // Write your anroidnotificaiton channel from Cloud messaging -> new notification ->Additional options Android Notification Channel
      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("personalApp", "personalApp channel", importance: Importance.max, priority: Priority.high),
        iOS: IOSNotificationDetails(),
      );
      await flutterLocalNotificationsPlugin.show(id, message.notification!.title, message.notification!.body, notificationDetails, payload: message.data["name"].toString());
    } catch (e) {
      // ignore: avoid_print
      print("local_notification_service.dart Exception : $e");
    }
  }
}
