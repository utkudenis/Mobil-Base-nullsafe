// Package
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Styles
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
// Helpers
import '../../helpers/image_helper.dart';
import '../../helpers/localization_helper.dart';
// Widgets
import '../../widgets/spacing.dart';

class CustomToastMessage extends StatefulWidget {
  final FToast fToast;
  final String title;
  final String message;
  final Widget icon;
  final bool iconCheck;
  final bool cancelable;

  CustomToastMessage(this.fToast, {this.title = '', this.message = '', required this.icon, this.iconCheck = false, this.cancelable = false});

  @override
  _CustomToastMessageState createState() => _CustomToastMessageState();
}

Widget checkIcon = Container(
  height: 20,
  margin: EdgeInsets.only(right: 10),
  decoration: BoxDecoration(shape: BoxShape.circle, color: CustomColors.white, border: Border.all(width: 2, color: CustomColors.white)),
  child: imageAsset("assets/icons/20-check@3x.png", scale: 0.8, color: CustomColors.gray90, width: 24, height: 24),
);

class _CustomToastMessageState extends State<CustomToastMessage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: CustomColors.gray90,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.iconCheck ? widget.icon : SizedBox(),
              Expanded(
                child: Text(
                  widget.title,
                  style: customBoldTextStyle(Colors.white, fontSize: 14.0, height: 20.0 / 14.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.fToast.removeCustomToast();
                  widget.fToast.removeQueuedCustomToasts();
                  // Do your action!!
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          widget.message == ''
              ? SizedBox()
              : Spacing(
                  height: 10,
                ),
          widget.message == ''
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.message,
                        style: customMediumTextStyle(Colors.white, fontSize: 14.0, height: 20.0 / 14.0),
                      ),
                    ),
                  ],
                ),
          widget.cancelable
              ? Spacing(
                  height: 10,
                )
              : SizedBox(),
          widget.cancelable
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        localize(context, "Undo"),
                        style: customMediumTextStyle(CustomColors.blue50Default, fontSize: 14.0, height: 20.0 / 14.0),
                      ),
                      onTap: () {
                        // Do your Action !!
                        widget.fToast.removeCustomToast();
                        widget.fToast.removeQueuedCustomToasts();
                      },
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      child: Lottie.asset(
                        'assets/gifs/jsons/loader.json',
                        controller: _controller,
                        onLoaded: (composition) {
                          // Configure the AnimationController with the duration of the
                          // Lottie file and start the animation.
                          _controller
                            ..duration = composition.duration
                            ..forward();
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
