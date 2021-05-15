// Packages
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Widgets
import '../../widgets/ToastMessages/toast_message.dart';
import '../../widgets/ToastMessages/notification_message.dart';

class ToastMessageHelper {
  static FToast createFToast(BuildContext context) {
    FToast fToast;
    fToast = FToast();
    fToast.init(context);

    return fToast;
  }

  // Tik iconu buradan copy paste yapabilirsiniz
  /*Widget icon = Container(
      height: 20,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(shape: BoxShape.circle, color: ApmColors.white, border: Border.all(width: 2, color: ApmColors.white)),
      child: imageAsset(
        "assets/icons/iconCheck@3x.png",
        scale: 0.8,
        color: ApmColors.gray90,
      ),
    );*/

  static void show(
    BuildContext context, {
    String title = '',
    String message = '',
    int toastDuration = 2,
    int notificationDuration = 3,
    int cancelableDuration = 5,
    bool cancelable = false,
    Widget icon,
    bool iconCheck = false,
    Widget notificationContent,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    bool notification = false,
    FToast notificationToast,
  }) {
    final fToast = createFToast(context);
    Widget toastContent = notification
        ? CustomNotificationMessage(notificationToast, icon: icon, notificationContent: notificationContent, message: message)
        : CustomToastMessage(fToast, cancelable: cancelable, icon: icon, iconCheck: iconCheck, title: title, message: message);

    notification
        ? fToast.showToast(
            child: toastContent,
            toastDuration: Duration(seconds: notificationDuration),
            positionedToastBuilder: (context, child) {
              return Positioned(
                child: child,
                top: 35.0,
                left: 20.0,
                right: 20.0,
              );
            })
        : fToast.showToast(
            child: toastContent,
            gravity: toastGravity,
            toastDuration: cancelable ? Duration(seconds: cancelableDuration) : Duration(seconds: toastDuration),
          );
  }
}
