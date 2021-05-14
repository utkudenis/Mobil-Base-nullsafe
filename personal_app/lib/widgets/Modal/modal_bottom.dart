// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Helpers
import '../../helpers/localization_helper.dart';
import '../../helpers/Modal/modal_helper.dart';
// Widgets
import 'modal_title.dart';
import 'modal_bottom_indicator.dart';
import 'modal_buttom_buttons.dart';
import 'modal_text_area.dart';
import 'text_field_information.dart';
import '../spacing.dart';
// Custom Class
import 'text_area_controller.dart';

class ModalBottom extends StatefulWidget {
  final Widget content;
  final Widget contentText;

  final String title;
  final ShapeBorder shape;
  final Widget text;
  final String textAreaText;
  final String textAreaHintText;

  final int minLines;
  final int maxLines;
  final double horizontalPadding;
  final double height;
  final bool enableTextArea;
  final bool enableSaveAndCancelButtons;

  final Function onCancel;
  final Function onSave;
  final Function(String value) onTextAreaChanged;

  final TextAreaController textAreaController;

  ModalBottom({
    this.title,
    this.content,
    this.shape,
    this.horizontalPadding,
    this.text,
    this.enableTextArea = false,
    this.textAreaText,
    this.textAreaHintText,
    this.textAreaController,
    this.onTextAreaChanged,
    this.enableSaveAndCancelButtons = false,
    this.minLines = 2,
    this.maxLines = 3,
    this.onCancel,
    this.onSave,
    this.height,
    this.contentText,
  });

  @override
  _ModalBottomState createState() => _ModalBottomState(this.textAreaController);
}

class _ModalBottomState extends State<ModalBottom> {
  TextAreaController textAreaController;

  _ModalBottomState(this.textAreaController);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: new BoxDecoration(color: Colors.white, borderRadius: new BorderRadius.only(topLeft: const Radius.circular(8.0), topRight: Radius.circular(8.0))),
      child: Column(children: [
        Padding(
          padding: new EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
          child: Column(
            children: [
              ModalBottomIndicator(),
              Spacing(
                height: 12,
              ),
              widget.title == null
                  ? SizedBox()
                  : Column(
                      children: [
                        ModalTitle(widget.title),
                        Spacing(
                          height: 24,
                        ),
                      ],
                    ),
              widget.content ?? Container(),
              widget.contentText ?? Container(),
              widget.text ?? Container(),
              widget.enableTextArea
                  ? ModalTextArea(
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      autoFocus: true,
                      text: widget.textAreaText,
                      textAreaController: textAreaController,
                      hintText: widget.textAreaHintText,
                      onChanged: (String value) {
                        setState(() {
                          textAreaController.currentLength = value.length;
                        });

                        if (widget.onTextAreaChanged != null) {
                          widget.onTextAreaChanged(value);
                        }
                      },
                    )
                  : Container()
            ],
          ),
        ),
        (textAreaController != null && widget.enableTextArea) ? TextFieldInformation(textAreaController) : Container(),
        widget.enableSaveAndCancelButtons
            ? ModalBottomButtons(
                isRightButtonDisabled: !textAreaController.isOK,
                onLeftClick: () {
                  ModalHelper.closeModals(context);
                  widget.onCancel();
                },
                onRightClick: widget.onSave,
                leftButtonText: localize(context, 'Cancel'),
                rightButtonText: localize(context, 'Save'),
              )
            : Container()
      ]),
    );
  }
}
