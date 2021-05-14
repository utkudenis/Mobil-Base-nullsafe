import './colors.dart';
import 'package:flutter/material.dart';

const double defaultFontSize = 14.0;
const double defaultHeightSize = 1.0;

TextStyle customBoldTextStyle(color, {fontSize = defaultFontSize, height = defaultHeightSize}) {
  return TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize, color: color, height: height);
}

TextStyle  customMediumTextStyle(color, {fontSize = defaultFontSize, height = defaultHeightSize}) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize, color: color, height: height);
}

TextStyle  customOkrTitleStyle({color = Colors.white, double fontSize = 20, height = 1.8}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color, height: height);
}

TextStyle  customInfoTextStyle({color = CustomColors.blue50Default, double fontSize = 14, height = 1.5, decoration: TextDecoration.none}) {
  return TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: 'Quicksand', fontSize: fontSize, color: color, height: height, decoration: decoration);
}

TextStyle  customRichTextStyle({color = CustomColors.gray60, double fontSize = 12, height = 1.7, decoration: TextDecoration.none}) {
  return TextStyle(fontWeight: FontWeight.normal, fontSize: fontSize, color: color, height: height, decoration: decoration);
}

TextStyle  customModalTitleStyle({double fontSize = 20, height = 1.4}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: Colors.grey[90], height: height);
}

TextStyle  customActionsButtonTitleStyle({double fontSize = 16, height = 1.5, color = CustomColors.gray90}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color, height: height);
}

TextStyle  customRadioListTileStyle({color = Colors.white, double fontSize = 16, double height = 1.5}) {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color, height: height);
}

TextStyle customOkrProgressStatusSelectTextStyle({color = Colors.white, double fontSize = 14, double height = 1.4}) {
  return TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize, color: color, height: height);
}

TextStyle  customFieldTextStyle() {
  return TextStyle(color: CustomColors.gray90, fontWeight: FontWeight.w500, fontFamily: "Quicksand", fontStyle: FontStyle.normal, height: 1.5, fontSize: 16.0);
}

TextStyle  customFeedbackChatMessagesListTextStyle({color = CustomColors.gray90}) {
  return TextStyle(color: color, fontWeight: FontWeight.normal, fontFamily: "Quicksand", height: 1.5, fontSize: 16.0);
}

TextStyle  customv2FeedbackChatMessagesTextStyle({color = CustomColors.gray90, fontSize = 14.0}) {
  return TextStyle(color: color, fontWeight: FontWeight.normal, fontFamily: "Quicksand-Medium", height: 1.5, fontSize: fontSize);
}

TextStyle  customSupportInformationListTextStyle({color = CustomColors.gray90, double fontSize = 16, decoration = TextDecoration.none}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.5, fontSize: fontSize, decoration: decoration);
}

TextStyle  customFeedbackChatMessagesReadMoreTextStyle({color = CustomColors.gray90, decoration = TextDecoration.none}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.5, fontSize: 14.0, decoration: decoration);
}

TextStyle  customFeedbackChatDateTimeTextStyle({color = CustomColors.gray90, fontSize = 12.0}) {
  return TextStyle(color: color, fontWeight: FontWeight.normal, fontFamily: "Quicksand", height: 1.5, fontSize: fontSize);
}

TextStyle  customv2FeedbackChatDateTimeTextStyle({color = CustomColors.gray90, fontSize = 12.0}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.5, fontSize: fontSize);
}

TextStyle  customFeedbackChatDateTimeTextStyleBold({color = CustomColors.gray90}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand-light", height: 1.5, fontSize: 12.0);
}

TextStyle  customLogoTextStyle({color = Colors.white}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.4, fontSize: 11.0);
}

TextStyle  customNotificationTileHeaderTextStyle({color = CustomColors.gray60}) {
  return TextStyle(color: color, fontWeight: FontWeight.normal, fontFamily: "Quicksand", height: 1.5, fontSize: 14.0);
}

TextStyle  customNormalTextStyle({color = CustomColors.gray60}) {
  return TextStyle(color: color, fontWeight: FontWeight.normal, fontFamily: "Quicksand", height: 1.6, fontSize: 12.0);
}

TextStyle  customPeerOkrInfoHeaderTextStyle({color = CustomColors.gray60}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.5, fontSize: 14.0);
}

TextStyle  customOkrInfoHeaderTextStyle({color = CustomColors.gray60}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: 1.5, fontSize: 14.0);
}

TextStyle  customNotificationTileContentTextStyle({color = CustomColors.gray90, fontWeight = FontWeight.normal}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontFamily: "Quicksand-light", height: 1.5, fontSize: 14.0);
}

TextStyle  customShowDialogTitleTextStyle() {
  return TextStyle(
    color: CustomColors.gray90,
    fontWeight: FontWeight.bold,
    fontFamily: "Quicksand",
    fontSize: 20.0,
    height: 1.4,
  );
}

TextStyle  customShowDialogContentTextStyle() {
  return TextStyle(
    color: CustomColors.gray60,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: "Quicksand",
    fontSize: 16.0,
    height: 1.5,
  );
}

TextStyle  customArrowDownBottomSheetContentTextStyle({color = CustomColors.gray60}) {
  return TextStyle(
    color: color,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: "Quicksand",
    fontSize: 16.0,
    height: 1.5,
  );
}

TextStyle  customBottomSheetContentTextStyle({color = CustomColors.gray60}) {
  return TextStyle(
    color: color,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: "Quicksand",
    fontSize: 16.0,
    height: 1.5,
  );
}

TextStyle  customProfileSettingsBottomSheetContentTextStyle({color = CustomColors.gray90}) {
  return TextStyle(
    color: color,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: "Quicksand",
    fontSize: 16.0,
    height: 1.5,
  );
}

TextStyle  customShowDialogButtonTextStyle({color = Colors.white, double fontSize = 14, double height = 1.4}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold, fontFamily: "Quicksand", height: height);
}

TextStyle  customFieldTextHintStyle() {
  return TextStyle(color: const Color(0xffa1a1a1), fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, height: 1.5, fontSize: 16.0);
}

TextStyle  customFieldInfoLabelStyle() {
  return TextStyle(color: const Color(0xffa1a1a1), fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, height: 1.5, fontSize: 14.0);
}

TextStyle  customTextBoxLabelStyle({Color color = CustomColors.gray90}) {
  return TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w700);
}

TextStyle  customAppBarTitleStyle({Color color = CustomColors.gray90}) {
  return TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w700);
}

TextStyle  customAddOkrBottomSaveButton({Color color = CustomColors.gray50}) {
  return TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w700);
}

TextStyle customMediumItalicTextStyle(color, {fontSize = defaultFontSize, height = defaultHeightSize}) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize, color: color, height: height, fontStyle: FontStyle.italic);
}
