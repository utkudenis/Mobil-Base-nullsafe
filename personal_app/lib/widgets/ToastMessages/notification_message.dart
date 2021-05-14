// Package
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Styles
import '../../theme/colors.dart';

class CustomNotificationMessage extends StatefulWidget {
  final FToast fToast;
  final String title;
  final String message;
  final Widget icon;
  final Widget notificationContent;

  CustomNotificationMessage(this.fToast, {this.title = '', this.message = '', this.icon, this.notificationContent});

  @override
  _CustomNotificationMessageState createState() => _CustomNotificationMessageState();
}

class _CustomNotificationMessageState extends State<CustomNotificationMessage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: CustomColors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: widget.icon == null ? SizedBox() : widget.icon),
          Expanded(flex: 7, child: widget.notificationContent),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                widget.fToast.removeCustomToast();
                widget.fToast.removeQueuedCustomToasts();
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.close,
                  color: CustomColors.gray50,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
