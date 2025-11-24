import 'package:flutter/material.dart';
import 'package:flutter_application_15cubit/chat_app/appbarr.dart';
import 'package:flutter_application_15cubit/chat_app/buildPhoneInputField.dart';
import 'package:flutter_application_15cubit/chat_app/buildnextstepbullon.dart';
import 'package:flutter_application_15cubit/chat_app/buildpart3.dart';
import 'package:flutter_application_15cubit/chat_app/buildtags.dart';
import 'package:flutter_application_15cubit/chat_app/loginverification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarr(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
           padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                const Text(
                  'Login On Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Buildtags(isLoginActive: true),
                const SizedBox(height: 30),
                Buildphoneinputfield(
                  title: 'Phone Number',
                  hintText: '+43 123-456-7890',
                ),
                SizedBox(height: 50),
                Buildnextstepbullon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                Loginverification(),
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 50),
                Buildpart(comment: "Don't Have Account?", action: 'Signin'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
