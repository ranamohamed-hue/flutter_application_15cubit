import 'package:flutter/material.dart';

class Buildtags extends StatelessWidget {
  final bool isLoginActive;
  final VoidCallback onlogintap;
  final VoidCallback onverification;

  const Buildtags({
    super.key,
    required this.isLoginActive,
    required this.onlogintap,
    required this.onverification,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onlogintap,
              child: _buildTabContent(
                'Login',
                Icons.login_outlined,
                isLoginActive,
              ),
            ),
            SizedBox(width: 40),
            GestureDetector(
              onTap: onverification,
              child: _buildTabContent(
                'Verification',
                Icons.verified_outlined,
                !isLoginActive,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabContent(String title, IconData icon, bool isactive) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: isactive ? Colors.purpleAccent : Colors.grey,
              size: 20,
            ),

            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isactive ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),
        isactive
            ? Container(height: 5, width: 120, color: Colors.purple)
            : const SizedBox(height: 5, width: 120),
      ],
    );
  }
}
