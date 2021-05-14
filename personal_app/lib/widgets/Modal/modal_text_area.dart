// Package
import 'package:flutter/material.dart';
// Style
import '../../theme/text_styles.dart';
// Custom Class
import 'text_area_controller.dart';


class ModalTextArea extends StatefulWidget {
  final String hintText;
  final String secondHintText;
  final bool autoFocus;
  final int minLines;
  final int maxLines;
  final String text;
  final Function(String) onChanged;

  final TextAreaController textAreaController;

  ModalTextArea({
    this.hintText,
    this.autoFocus = false,
    this.minLines = 4,
    this.maxLines = 6,
    this.text = '',
    this.textAreaController,
    this.onChanged,
    this.secondHintText = "",
  });

  @override
  _ModalTextAreaState createState() => _ModalTextAreaState(this.textAreaController);
}

class _ModalTextAreaState extends State<ModalTextArea> {
  final TextAreaController textAreaController;
  // final String text;

  bool checkSecondHinttext = false;
  _ModalTextAreaState(this.textAreaController);
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext sacontext) {
    this.textAreaController.clear = () {
      _textEditingController.clear();
    };

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              initialValue: this.widget.text,
              style: customFieldTextStyle(),
              onTap: () {
                setState(() {
                  if (this.widget.secondHintText == "") {
                    checkSecondHinttext = false;
                  } else {
                    checkSecondHinttext = true;
                  }
                });
              },
              decoration: InputDecoration(
                counter: Container(),
                hintText: checkSecondHinttext ? widget.secondHintText : widget.hintText,
                hintStyle: customFieldTextHintStyle(),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              scrollPadding: EdgeInsets.all(20.0),
              keyboardType: TextInputType.text,
              minLines: this.widget.minLines,
              maxLines: this.widget.maxLines,
              autofocus: this.widget.autoFocus,
              onChanged: (value) {
                setState(() {
                  if (textAreaController != null) {
                    textAreaController.currentLength = value.length;
                  }
                });

                if (this.widget.onChanged != null) {
                  this.widget.onChanged(value);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
