import 'package:flutter/material.dart';

class CustomHomeTitlesWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomHomeTitlesWidget({
    super.key,
    required this.title,
    this.onTap,
    this.padding = const EdgeInsets.only(),
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Kodchasan',
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
