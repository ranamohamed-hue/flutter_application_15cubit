import 'package:flutter/material.dart';

class Buildnextstepbullon extends StatelessWidget {
  final VoidCallback onPressed;
  const Buildnextstepbullon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.fast_forward, color: Colors.white, size: 15),
          label: const Text(
            '  Next Step   ',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
