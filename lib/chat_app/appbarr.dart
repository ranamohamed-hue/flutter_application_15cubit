import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/double_wave_painter.dart';

class Appbarr extends StatelessWidget implements PreferredSizeWidget {
  const Appbarr({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 150; // ارتفاع الـ AppBar

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: height,
      flexibleSpace: Stack(
        children: [
          // الخلفية الموجية تغطي كامل المساحة
          CustomPaint(
            size: Size(double.infinity, height),
            painter: DoubleWavePainter(),
          ),

          Positioned(
            top: height * 0.40, 
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Chat App',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
