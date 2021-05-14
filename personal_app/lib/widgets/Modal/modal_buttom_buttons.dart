// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Style
import '../../theme/fonts.dart';

class ModalBottomButtons extends StatelessWidget {
  final bool isRightButtonDisabled;
  final bool isLeftButtonDisabled;
  final Function onLeftClick;
  final Function onRightClick;
  final String leftButtonText;
  final String rightButtonText;

  const ModalBottomButtons({Key key, this.isLeftButtonDisabled = false, this.isRightButtonDisabled = false, this.onLeftClick, this.onRightClick, @required this.leftButtonText, @required this.rightButtonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CupertinoButton(
            child: Text(
              // localize(context, 'Cancel'),
              this.leftButtonText,
              style: isLeftButtonDisabled ? TextStyles.oneLeft2Gray1Light2Disabled7H300 : TextStyles.oneLeft7Blue7H300,
            ),
            onPressed: () {
              if (this.onLeftClick != null) {
                this.onLeftClick();
              }
            },
          ),
          Expanded(
            child: Container(),
          ),
          CupertinoButton(
            child: Text(
              // localize(context, 'Save'),
              this.rightButtonText,
              style: isRightButtonDisabled ? TextStyles.oneLeft2Gray1Light2Disabled7H300 : TextStyles.oneLeft7Blue7H300,
            ),
            onPressed: () {
              if (this.onRightClick != null && !isRightButtonDisabled) {
                this.onRightClick();
              }
            },
          )
        ],
      ),
    );
  }
}
