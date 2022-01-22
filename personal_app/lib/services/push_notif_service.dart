// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/services/local_notification_service.dart';
import 'package:personal_app/services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// initialize it after user login
/*Future<dynamic> registerNotificationToken() async {
    final PushNotifService notifications = PushNotifService();
    final String fcmToken = await notifications.initFirebase();
    if (fcmToken != "") {
      // ignore: avoid_print
      print("===FCM TOKEN====");
      // ignore: avoid_print
      print(fcmToken);
      final String? _token = await SharedPrefsService().getToken();
      final Response _response = await http.post(
        Uri.parse(Your server token registration),
        body: {"fcm_device_token": fcmToken},
        headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      );
      if (_response.statusCode == 200) {
        debugPrint("Fcm Token succesfully registered to Backend ");
      } else {
        debugPrint(
            "Problem ! Fcm Token Cannot registered to Backend! file : auth_provider.dart  registerNotificationToken() ");
      }
    } else {
      debugPrint(
          "Fcm Token Cannot taken from PushNotifService.initFireBase() ! ");
    }
  }*/

Future<void> backgroundHandler(RemoteMessage message) async {
  // it is not useful for falsepeti. it is for more complex apps
  // because it is out of context and only useful for specific tasks
  print("Background handler works");
  print(message.data.toString());
  print(message.notification!.title);
}

class PushNotifService {
  String fcmToken = "";
  static final PushNotifService _singleton = PushNotifService._internal();
  bool campaigns = false;
  bool initiated = false;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  late SharedPreferences prefs;
  factory PushNotifService() {
    final PushNotifService nt = PushNotifService._singleton;
    nt._initialize();
    return nt;
  }

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
    campaignNotification();
  }

  Future<void> campaignNotification() async {
    final prefsCampaign = prefs.getBool("campaigns");
    if (prefsCampaign == null) {
      prefs.setBool("campaigns", true);
      campaigns = true;
    } else if (prefsCampaign) {
      campaigns = true;
    } else {
      campaigns = false;
    }

    if (campaigns) {
      firebaseMessaging.subscribeToTopic("campaigns");
    } else {
      firebaseMessaging.unsubscribeFromTopic("campaigns");
    }
  }

  Future<void> _onTapNotification(RemoteMessage? msg) async {
    debugPrint("_onTapNotification msg : $msg");

    if (msg == null) {
      return NavigationService().pushNamed('home');
    }
    // design it according to your name value
    switch (msg.data["name"].toString()) {
      case 'refresh':
        return NavigationService().pushNamed('home');
      case 'logout':
        return NavigationService().pushNamed('login');
      default:
        return NavigationService().pushNamed('home');
    }
  }

  Future<String?> getFcmToken() async {
    final String? token = await firebaseMessaging.getToken();
    return token;
  }

  Future<String> initFirebase() async {
    if (initiated) {
      if (fcmToken == "") {
        fcmToken = (await getFcmToken())!;
      }
      return fcmToken;
    }
    LocalNotificationService.initialize();
    await Firebase.initializeApp();

    debugPrint("Firebase auto init status: ${firebaseMessaging.isAutoInitEnabled}");

    firebaseMessaging.setAutoInitEnabled(true).then((_) => debugPrint("Firebase auto init status After Set: ${firebaseMessaging.isAutoInitEnabled}"));

    //Receive Message when app is in background
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        await _onTapNotification(message);
      }
    });

    // foreground works
    // they are examples for simple actions design it according to your system
    FirebaseMessaging.onMessage.listen((msg) {
      debugPrint("Firebase on Message :$msg");

      switch (msg.data["name"].toString()) {
        case 'refresh-profile':
          // refresh your state
          break;
        //Because of there is any context, you cannot refresh current porviders. To do that you need to do navigation and refresh page
        case 'credit-refresh':
          //refresh credit
          //refresh your state
          LocalNotificationService.display(msg);
          break;
        default:
          LocalNotificationService.display(msg);
          print("Not a functional message, Routing Message   FirebaseMessaging.onMessage.listen() msg : ${msg.data['name']}");
      }
    });
    //app in background and not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Firebase onMessageOpenedApp : $message');
      _onTapNotification(message);
    });
    // burası için kullanıcı izin vermez ise ( apple) ekrana uyarı basacak bir yapı yapılabilir. utku
    // https://firebase.flutter.dev/docs/messaging/usage/#requesting-permission-apple--web
    firebaseMessaging.requestPermission().then((notificationSettings) {
      // ignore: todo
      //TODO: buradaki settings clasının noString methodu yok buraya elle yapı yapılacak-utku
      notificationSettings.authorizationStatus.toString();
      debugPrint('Firebase request permission notificationSettigs : ${notificationSettings.authorizationStatus.toString()}');
    });
    firebaseMessaging.getToken().then((token) {
      if (token != null) {
        debugPrint('Firebase token :$token');
      }
    });
    firebaseMessaging.getAPNSToken().then((apnstoken) {
      if (apnstoken != null) {
        debugPrint('Firebase APNStoken:$apnstoken');
      }
    });

    initiated = true;
    // ignore: join_return_with_assignment
    fcmToken = (await getFcmToken())!;
    return fcmToken;
  }

  PushNotifService._internal();
}
