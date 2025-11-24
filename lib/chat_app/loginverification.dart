import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';
import 'package:flutter_application_15cubit/chat_app/buildPhoneInputField.dart';
import 'package:flutter_application_15cubit/chat_app/buildnextstepbullon.dart';
import 'package:flutter_application_15cubit/chat_app/buildpart3.dart';
import 'package:flutter_application_15cubit/chat_app/buildtags.dart';

class Loginverification extends StatefulWidget {
  const Loginverification({super.key});

  @override
  State<Loginverification> createState() => _LoginverificationState();
}

class _LoginverificationState extends State<Loginverification> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbarr(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const Text(
                  'Login On Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Buildtags(isLoginActive: false),
                const SizedBox(height: 30),
                Buildphoneinputfield(
                  title: 'User Verification Number',
                  hintText: 'User Verification Number...',
                ),
                SizedBox(height: 20),
                Buildnextstepbullon(onPressed: () {}),
                SizedBox(height: 20),
                Buildpart(comment: "Did Not Recive Code?", action: 'Try Again'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
