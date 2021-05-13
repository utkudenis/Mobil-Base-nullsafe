import 'package:flutter/material.dart';

//text colors
const Color defaultTextColor = Color.fromRGBO(26, 32, 44, 1.0);
const Color textOrange = Color.fromRGBO(240, 135, 0, 1.0);
const Color textGray60 = Color.fromRGBO(113, 128, 150, 1.0);
const Color textGray90 = Color.fromRGBO(26, 32, 44, 1.0);

//background
const Color defaultBlue = Color.fromRGBO(0, 153, 232, 1.0);
const Color backOrange = Color.fromRGBO(253, 240, 224, 1.0);
const Color backPurple = Color.fromRGBO(245, 244, 254, 1.0);

ThemeData basicTheme() {
  final baseTheme = ThemeData(
      fontFamily: 'Quicksand',
      visualDensity: VisualDensity.adaptivePlatformDensity);

  return baseTheme.copyWith();
}