import 'package:flutter/material.dart';

Widget imageAsset(
  name, {
  required Color color,
  required double width,
  required double height,
  required double scale,
}) {
  return Image.asset(
    name,
    color: color,
    width: width,
    height: height,
    scale: scale,
  );
}
