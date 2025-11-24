import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbarr(),
      body: Container(color: Colors.pink),
    );
  }
}
