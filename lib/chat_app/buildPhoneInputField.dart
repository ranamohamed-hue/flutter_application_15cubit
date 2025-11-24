import 'package:flutter/material.dart';

class Buildphoneinputfield extends StatelessWidget {
   final String title;
  final String hintText;
  const Buildphoneinputfield({super.key,required this.title,required this.hintText});

  @override
  Widget build(BuildContext context) {
     return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: title,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
      prefixIcon: const Icon(Icons.call, color: Colors.purpleAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.purpleAccent, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    ),
  );
}
}