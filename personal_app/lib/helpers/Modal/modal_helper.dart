// Packages
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
// Styles
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
// Widgets
import '../../widgets/Modal/modal_bottom.dart';
import '../../widgets/spacing.dart';
// Custom Class
import '../../widgets/Modal/text_area_controller.dart';

enum ButtonOrder { vertical, horizontal }

class PointerBool {
  bool dropOkr;
  PointerBool(this.dropOkr);
}

class ModalHelper {
  static void showBottomModal(
    BuildContext context, {
    Widget content,
    Widget contentText,
    String title,
    double horizontalPadding = 20,
    Widget text,
    ShapeBorder shape,
    Function onClose,
    bool enableTextArea = false,
    String textAreaText,
    String textAreaHintText,
    TextAreaController textAreaController,
    Function(String value) onTextAreaChanged,
    bool enableSaveAndCancelButtons = false,
    int minLines = 2,
    int maxLines = 3,
    Function onCancel,
    Function onSave,
    double height,
  }) {
    showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ModalBottom(
                    height: height,
                    title: title,
                    shape: shape,
                    text: text,
                    content: content,
                    contentText: contentText,
                    horizontalPadding: horizontalPadding,
                    enableTextArea: enableTextArea,
                    textAreaText: textAreaText,
                    textAreaHintText: textAreaHintText,
                    textAreaController: textAreaController,
                    onTextAreaChanged: onTextAreaChanged,
                    enableSaveAndCancelButtons: enableSaveAndCancelButtons,
                    minLines: minLines,
                    maxLines: maxLines,
                    onCancel: onCancel,
                    onSave: onSave,
                  ),
                ),
              );
            },
            context: context)
        .then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  // for url route
  static void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// Custom Dialog for Kvkk
  static void showModalDialogwithCloseIcon(
    BuildContext context, {
    Color color = CustomColors.blue50Default,
    String contentTextTop = "Top Text",
    String contextTextClickable = "tıklayınız/click here",
    String contextTextClickUrl = "https://www.google.com/",
    String contextTextBottom = "bottom Text",
    ButtonOrder buttonOrder = ButtonOrder.vertical,
    bool enableFirstButton = false,
    Function onFirstButtonClick,
    String firstButtonText,
    Widget icon,
    Function onClose,
  }) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        barrierLabel: "",
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0.0),
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: FractionalOffset.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/iconX@3x.png"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
                      content: Column(
                        children: [
                          icon,
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(style: customShowDialogContentTextStyle(), children: <TextSpan>[
                              TextSpan(
                                text: contentTextTop,
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () => _launchURL(contextTextClickUrl),
                                text: contextTextClickable,
                                style: TextStyle(color: CustomColors.blue50Default, decoration: TextDecoration.underline),
                              )
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(style: customShowDialogContentTextStyle(), children: <TextSpan>[
                                TextSpan(
                                  text: contextTextBottom,
                                )
                              ])),
                          Spacing(
                            height: 20,
                          ),
                          Column(
                            children: [
                              enableFirstButton
                                  ? Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: ElevatedButton(
                                        child: Center(
                                          child: firstButtonText != null
                                              ? Text(
                                                  firstButtonText,
                                                  style: customShowDialogButtonTextStyle(color: CustomColors.white),
                                                )
                                              : Container(),
                                        ),
                                        style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(color)),
                                        onPressed: () {
                                          if (onFirstButtonClick != null) {
                                            onFirstButtonClick();
                                          }
                                        },
                                      ),
                                    )
                                  : Container(),
                              Spacing(
                                height: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        }).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  static void closeModals(BuildContext context) {
    Navigator.pop(context);
  }

  static void showModalDialog(BuildContext context,
      {String title,
      Color color = CustomColors.blue50Default,
      Color borderColor = CustomColors.blue50Default,
      String contentText,
      ButtonOrder buttonOrder = ButtonOrder.vertical,
      bool enableFirstButton = false,
      bool enableSecondButton = false,
      PointerBool checkBoxValue,
      Function onFirstButtonClick,
      Function onSecondButtonClick,
      String firstButtonText,
      Color firstButtonTextColor = CustomColors.white,
      Color secondButtonTextColor = CustomColors.blue50Default,
      String secondButtonText,
      Widget icon,
      Widget checkBoxText,
      Function onClose}) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                      title: icon != null
                          ? Column(
                              children: [
                                icon,
                                SizedBox(
                                  height: 16,
                                ),
                                title != null
                                    ? Text(
                                        title,
                                        style: customShowDialogTitleTextStyle(),
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(),
                              ],
                            )
                          : title != null
                              ? Text(
                                  title,
                                  style: customShowDialogTitleTextStyle(),
                                  textAlign: TextAlign.center,
                                )
                              : Container(),
                      content: Column(
                        children: [
                          (contentText != null
                              ? Text(
                                  contentText,
                                  style: customShowDialogContentTextStyle(),
                                  textAlign: TextAlign.center,
                                )
                              : Container()),
                          Spacing(
                            height: 10,
                          ),
                          Column(
                            children: [
                              checkBoxText != null
                                  ? Row(children: [
                                      Checkbox(
                                        value: checkBoxValue.dropOkr,
                                        activeColor: CustomColors.blue50Default,
                                        onChanged: (bool newValue) {
                                          // print("New Value = " + newValue.toString());
                                          setState(() {
                                            checkBoxValue.dropOkr = newValue;
                                          });
                                          // print("state.checkBoxValue value 1. = " + checkBoxValue.dropOkr.toString());
                                        },
                                      ),
                                      checkBoxText,
                                    ])
                                  : SizedBox(),
                              checkBoxText != null
                                  ? Spacing(
                                      height: 10,
                                    )
                                  : SizedBox(
                                      height: 10,
                                    ),
                              enableFirstButton
                                  ? Container(
                                      height: 40,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(4.0),
                                      ),
                                      child: ElevatedButton(
                                        child: Center(
                                          child: firstButtonText != null
                                              ? Text(
                                                  firstButtonText,
                                                  // localize(context, 'Confirm'),
                                                  style: customShowDialogButtonTextStyle(color: firstButtonTextColor),
                                                )
                                              : Container(),
                                        ),
                                        style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(color)),
                                        onPressed: () {
                                          if (onFirstButtonClick != null) {
                                            onFirstButtonClick();
                                          }
                                        },
                                      ),
                                    )
                                  : Container(),
                              Spacing(
                                height: 8,
                              ),
                              enableSecondButton
                                  ? Container(
                                      height: 40,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(4.0),
                                        border: Border.all(color: borderColor, width: 1.0),
                                      ),
                                      child: ElevatedButton(
                                        child: Center(
                                          child: secondButtonText != null
                                              ? Text(
                                                  // localize(context, 'Cancel'),
                                                  secondButtonText,
                                                  style: customShowDialogButtonTextStyle(color: secondButtonTextColor),
                                                )
                                              : Container(),
                                        ),
                                        style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(CustomColors.white)),
                                        onPressed: () {
                                          // Navigator.pop(context, showBottomModal);
                                          if (onSecondButtonClick != null) {
                                            onSecondButtonClick();
                                          }
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        }).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }
}
