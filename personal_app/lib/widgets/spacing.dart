import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;
  Spacing({this.height = 1, this.width = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: this.height,
      width: this.width,
    );
  }
}
