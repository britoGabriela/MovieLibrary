import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTitlesWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Alignment alignment;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;
  final TextAlign textAlign;
  final Decoration decoration;

  const CustomTitlesWidget({
    super.key,
    required this.title,
    this.onTap,
    this.alignment = Alignment.centerLeft,
    this.padding = const EdgeInsets.only(),
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.white,
    this.height = 1.4,
    this.textAlign = TextAlign.justify,
    this.decoration = const BoxDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: decoration,
          padding: padding,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              height: height,
            ),
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
