import 'package:flutter/material.dart';

Widget imageAsset(
  name, {
  Color color,
  double width,
  double height,
  double scale,
}) {
  return Image.asset(
    name,
    color: color,
    width: width,
    height: height,
    scale: scale,
  );
}
