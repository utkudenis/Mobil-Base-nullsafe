// Packages
import 'package:flutter/material.dart';
// Styles
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
// Widgets
import '../../widgets/Modal/modal_bottom.dart';
import '../../widgets/spacing.dart';
// Custom Class
import '../../widgets/Modal/text_area_controller.dart';

enum ButtonOrder { vertical, horizontal }

class ModalHelperStaticFullHeight {
  static void showBottomModal(
    BuildContext context, {
    Widget content,
    String title,
    double horizontalPadding = 20,
    Widget text,
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: ModalBottom(
                      height: height,
                      title: title,
                      text: text,
                      content: SingleChildScrollView(child: content),
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
                ],
              );
            },
            context: context)
        .then((value) {
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
      String contentText,
      ButtonOrder buttonOrder = ButtonOrder.vertical,
      bool enableFirstButton = false,
      bool enableSecondButton = false,
      Function onFirstButtonClick,
      Function onSecondButtonClick,
      String firstButtonText,
      String secondButtonText,
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
                  AlertDialog(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    title: title != null
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
                          height: 24,
                        ),
                        Column(
                          children: [
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
                            enableSecondButton
                                ? Container(
                                    height: 40,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(4.0),
                                      border: Border.all(color: CustomColors.blue50Default, width: 1.0),
                                    ),
                                    child: ElevatedButton(
                                      child: Center(
                                        child: secondButtonText != null
                                            ? Text(
                                                // localize(context, 'Cancel'),
                                                secondButtonText,
                                                style: customShowDialogButtonTextStyle(color: CustomColors.blue50Default),
                                              )
                                            : Container(),
                                      ),
                                      style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(color)),
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
                  ),
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
