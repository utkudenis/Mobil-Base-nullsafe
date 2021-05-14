// Package
import 'package:flutter/material.dart';
// Style
import '../../theme/text_styles.dart';

class ModalTitle extends StatelessWidget {
  final String title;

  ModalTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: Text(
        this.title,
        style: customModalTitleStyle(),
      ),
    );
  }
}
