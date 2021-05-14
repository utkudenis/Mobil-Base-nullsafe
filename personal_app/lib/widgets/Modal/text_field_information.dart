// Packages
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// Helper
import '../../helpers/localization_helper.dart';
// Style
import '../../theme/colors.dart';
// Custom Class
import 'text_area_controller.dart';


class TextFieldInformation extends StatefulWidget {
  final TextAreaController textAreaController;

  const TextFieldInformation(this.textAreaController, {Key key}) : super(key: key);

  @override
  _TextFieldInformationState createState() => _TextFieldInformationState(this.textAreaController);
}

class _TextFieldInformationState extends State<TextFieldInformation> {
  TextAreaController textAreaController;
  _TextFieldInformationState(this.textAreaController);

  @override
  Widget build(BuildContext context) {
    Color _notOKTextColor = CustomColors.red50;
    Color _notOKBackgroundColor = CustomColors.red20;
    Color _okTextColor = CustomColors.gray50;
    Color _okBackgroundColor = CustomColors.gray20;
    Color _zeroTextColor = CustomColors.orange50;
    Color _zeroBackgroundColor = CustomColors.orange20;

    Color textColor;
    Color backgroundColor;

    if (this.textAreaController.currentLength < this.textAreaController.minLength) {
      textColor = _zeroTextColor;
      backgroundColor = _zeroBackgroundColor;
    } else if ((!this.textAreaController.isOK) || (this.textAreaController.maxLength != null && this.textAreaController.currentLength == this.textAreaController.maxLength)) {
      textColor = _notOKTextColor;
      backgroundColor = _notOKBackgroundColor;
    } else {
      textColor = _okTextColor;
      backgroundColor = _okBackgroundColor;
    }

    return Container(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Text(textAreaController.remainingLength.toString() + localize(context, 'apm_text_field_information_remaining_length'),
                    style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 12.0), textAlign: TextAlign.center),
              ),
            )
          ],
        ),
        height: 28,
        decoration: BoxDecoration(color: backgroundColor));
  }
}
