import 'package:flutter/material.dart';

// الألوان
const Color _kDarkPurple = Color.fromARGB(255, 192, 156, 190); // غامق
const Color _kLightPurple = Color.fromARGB(255, 155, 89, 182); // فاتح

class DoubleWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // --- الموجة السفلية (فاتح) ---
    var lightPaint = Paint()
      ..color = _kLightPurple
      ..style = PaintingStyle.fill;

    var lightPath = Path();
    lightPath.moveTo(0, size.height * 0.13);
    lightPath.quadraticBezierTo(
        size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.35);
    lightPath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.3, size.width, size.height * 0.4);
    lightPath.lineTo(size.width, size.height);
    lightPath.lineTo(0, size.height);
    lightPath.close();
    canvas.drawPath(lightPath, lightPaint);

    // --- الموجة العلوية (غامق) ---
    var darkPaint = Paint()
      ..color = _kDarkPurple
      ..style = PaintingStyle.fill;

    var darkPath = Path();
    darkPath.moveTo(0, size.height * 0.15);
    darkPath.quadraticBezierTo(
        size.width * 0.25, size.height * 0.25, size.width * 0.5, size.height * 0.2);
    darkPath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    darkPath.lineTo(size.width, 0);
    darkPath.lineTo(0, 0);
    darkPath.close();
    canvas.drawPath(darkPath, darkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
