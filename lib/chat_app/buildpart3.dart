import 'package:flutter/material.dart';

class Buildpart extends StatelessWidget {
  final String comment;
  final String action;
  const Buildpart({super.key, required this.comment, required this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(comment, style: TextStyle(color: Colors.black54, fontSize: 15)),
          TextButton(
            onPressed: () {},
            child: Text(
              action,
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
