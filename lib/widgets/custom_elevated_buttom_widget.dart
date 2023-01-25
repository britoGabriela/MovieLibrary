import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Icon icon;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;

  const CustomElevatedButtonWidget({
    super.key,
    required this.onPressed,
    this.color = const Color(0xFFBBBBBB),
    required this.icon,
    required this.title,
    this.fontSize = 11,
    this.fontWeight = FontWeight.w400,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: elevation,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
